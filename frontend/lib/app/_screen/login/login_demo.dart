// import 'package:frontend/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreenDemo extends StatelessWidget {
  const LoginScreenDemo({super.key});

  google() async {
//  const  clientID = FirebaseApp.app().,

    // const List<String> scopes = <String>[
    //   'email',
    //   'https://www.googleapis.com/auth/contacts.readonly',
    // ];

    // GoogleSignIn _googleSignIn = GoogleSignIn(
    //   // Optional clientId
    //   // clientId: 'your-client_id.apps.googleusercontent.com',
    //   scopes: scopes,
    // );

    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    // print(credential);
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId:
            'com.googleusercontent.apps.440722473262-qc1kbm2p8vpv8r8t9rjdvqm9qgp54f2d',
        scopes: ['email', 'profile'],
        signInOption: SignInOption.standard,
      ).signIn();

      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );

      // return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  loingRegister() async {
    // FirebaseAuth.instance.
    String message = '';

    // final credential = GoogleAuthProvider.credential(idToken: idToken);

    try {
      // final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: 'developersnepal@gmdail.com', password: 'password');
      UserCredential users = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: 'developersnepal@gmail.com', password: 'password');
      print(users);
    } on FirebaseAuthException catch (e) {
      print(e.message);

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = e.message as String;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: signInWithGoogle,
            child: const Text('Google'),
          ),
          ElevatedButton(
            onPressed: loingRegister,
            child: const Text('Login here'),
          ),
        ],
      ),
    );
  }
}
