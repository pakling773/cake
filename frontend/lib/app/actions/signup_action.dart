import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/app/models/user_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthAction {
  Future<dynamic> signUpWithEmailAndPassword(FormGroup form) async {
    final String email = form.control('email').value;
    final String password = form.control('password').value;
    final String name = form.control('name').value;

    //    String email, String password, String name
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      final accessToken = await auth.currentUser?.getIdToken();
      if (user != null) {
        // Create a new user document in Firestore or your database
        await createUserDocument(user.uid, name, email);

        final userModel = UserModel(
          id: user.uid,
          name: name,
          email: email,
          photoUrl: '',
          accessToken: accessToken!,
        );

        return userModel;
      }

      return "Something went wrong";
    } on FirebaseAuthException catch (e) {
      var error = "";
      if (e.code == 'weak-password') {
        error = ('Password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        error = ('The account already exists for that email.');
      } else {
        error = (e.code);
      }
      return error;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<void> createUserDocument(String uid, String name, String email) async {
    // Replace with your database interaction logic
    // This example assumes Firestore
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    final insert = await users.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      // Add other user data fields here
    });

    return insert;
  }

  Future<dynamic> signInWithEmailPassword(
      String email, String password) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      final accessToken = await auth.currentUser?.getIdToken();

      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userModel = UserModel(
          id: querySnapshot.docs[0]['uid'],
          name: querySnapshot.docs[0]['name'],
          email: querySnapshot.docs[0]['email'],
          photoUrl: '',
          accessToken: accessToken!,
        );
        return userModel;
      }
      return user;
    } on FirebaseAuthException catch (e) {
      String error = "";
      if (e.code == 'user-not-found') {
        error = ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        error = ('Wrong password provided for that user.');
      } else {
        error = (e.code);
      }
      return error;
      // Sncaker().showSnack(context, error, isError: true);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
