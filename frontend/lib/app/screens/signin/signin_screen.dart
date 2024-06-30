import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:frontend/app/common/helpers.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/signin/widgets/bottom_semicircle_clipper.dart';
import 'package:frontend/app/screens/signin/widgets/sign_in_form.dart';
import 'package:frontend/app/screens/signin/widgets/sign_in_menu.dart';
import 'package:frontend/app/screens/signin/widgets/signin_bottomtext.dart';
import 'package:frontend/main.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// The scopes required by this application.
// #docregion Initialize
const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  bool isLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cakeProvider.notifier).getCakes();
    });

    // final userP = ref.watch(userProvider);
    // String? email = userP?.email;
    // logger.i(email);

    super.initState();

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      bool isAuthorized = account != null;
      // However, on web...
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }

      setState(() {
        _currentUser = account;
        _isAuthorized = isAuthorized;
      });

      // logger.d(_currentUser);
      // print(_isAuthorized);
    });
    // _googleSignIn.signInSilently();
  }

  Future _handleSignIn() async {
    //login with gogole first
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      logger.d(credential);
      // Once signed in, return the UserCredential
//login with firebase

      UserCredential authData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final token = authData.credential?.accessToken as String;
      ref.watch(userProvider.notifier).saveUser(
            UserModel(
              id: authData.user!.uid,
              name: authData.user?.displayName as String,
              email: authData.user?.email as String,
              photoUrl: authData.user?.photoURL as String,
              accessToken: token,
            ),
          );

      logger.e(googleUser);
      context.goNamed(AppRouterEnum.home.name);
      return authData;
    } catch (e) {
      logger.e(e);
      //log errror alert
    }
  }

  _handleSignOut() async {
    final logout = await _googleSignIn.signOut();
    print(logout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SafeArea(child: SignInMenu()),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(children: [
                // Sign In Form
                SingleChildScrollView(
                  child: SignInForm(
                    signInParent: _handleSignIn,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BottomSemicircleClipper(),
                ),
                const Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: SigninBotttomtext(),
                ), // Bottom text Component
              ]),
            ),
          ),
        );
      }),
    );
  }
}
