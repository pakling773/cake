import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/fields/floating_input.dart';
import 'package:frontend/app/screens/@shared_widgets/snacker.dart';
import 'package:frontend/app/screens/@shared_widgets/submit_button.dart';
import 'package:frontend/app/actions/signup_action.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter/material.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class MustMatchValidator extends Validator<dynamic> {
  final String controlPassword;
  final String matchingPassword;

  MustMatchValidator({
    required this.controlPassword,
    required this.matchingPassword,
  });

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlPassword);
    final matchingFormControl = form.control(matchingPassword);

    if (formControl.value != matchingFormControl.value) {
      matchingFormControl.setErrors({'mustMatch': true});
    } else {
      matchingFormControl.removeError('mustMatch');
    }

    return null;
  }
}

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
      // value: 'Roma',
    ),
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
      // value: 'raxasd@mgail.com',
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(4),
      ],
      // value: 'tester',
    ),
    'passwordConfirmation': FormControl<String>(
      validators: [Validators.required],
      // value: 'tester',
    ),
  }, validators: [
    MustMatchValidator(
      controlPassword: 'password',
      matchingPassword: 'passwordConfirmation',
    ),
  ]);

//on signup button press
  onSignUp(BuildContext context) async {
    final signup = await AuthAction().signUpWithEmailAndPassword(form);

    if (signup.runtimeType == String) {
      Sncaker().showSnack(context, signup);
    } else {
      ref.read(userProvider.notifier).saveUser(signup);
      context.goNamed(AppRouterEnum.home.name);
    }
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

      context.goNamed(AppRouterEnum.home.name);
      return authData;
    } catch (e) {
      // logger.e(e);
      //log errror alert
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Name Field
          FloatingInput(
            label: "Name",
            formControlName: 'name',
            validationMessages: {
              'required': (error) => 'Please enter your name'
            },
          ),
          const SizedBox(
            height: 12,
          ),

          FloatingInput(
            label: "Email",
            formControlName: 'email',
            validationMessages: {
              'required': (error) => 'Please enter your email',
              'email': (error) => 'Please enter a valid email'
            },
          ),
          const SizedBox(
            height: 12,
          ),

          FloatingInput(
            label: 'Password',
            formControlName: 'password',
            validationMessages: {
              'required': (error) => 'Please enter your password',
              'minLength': (error) => 'Please enter at least 8 characters'
            },
          ),
          const SizedBox(
            height: 12,
          ),

          FloatingInput(
            formControlName: 'passwordConfirmation',
            validationMessages: {
              'required': (error) => 'Please confirm your password',
              'mustMatch': (error) => 'Passwords do not match'
            },
            label: "Confirm Password",
          ),

          const SizedBox(
            height: 40,
          ),

          ReactiveFormConsumer(
            builder: (context, form, child) {
              return Center(
                child: SubmitButton(
                  button_text: 'Register',
                  onSubmitClick: () => onSignUp(context),
                ),
              );
            },
          ),

          const SizedBox(
            height: 15,
          ),

          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                constraints: const BoxConstraints(maxWidth: 280),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        _handleSignIn();
                      },
                      child: Text(
                        'Sign up with Google',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 14,
                                  height: 16 / 14,
                                  color: AppColors.black,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
