/**
 import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper {
final FirebaseAuth _auth = FirebaseAuth.instance;
get user => _auth.currentUser;

//SIGN UP METHOD
Future signUp({String email, String password}) async {
try {
await _auth.createUserWithEmailAndPassword(
email: email,
password: password,
);
return null;
} on FirebaseAuthException catch (e) {
return e.message;
}
}

//SIGN IN METHOD
Future signIn({String email, String password}) async {
try {
await _auth.signInWithEmailAndPassword(email: email, password: password);
return null;
} on FirebaseAuthException catch (e) {
return e.message;
}
}

//SIGN OUT METHOD
Future signOut() async {
await _auth.signOut();

print('signout');
}
}

FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
if (user == null) {
  print('User is currently signed out!');
} else {
  print('User is signed in!');
}
});
    **/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './pages/home/home.dart';
import './pages/login/login.dart';

class AuthService {

  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context
  }) async {

    try {

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const Home()
          )
      );

    } on FirebaseAuthException catch(e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
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

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context
  }) async {

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const Home()
          )
      );

    } on FirebaseAuthException catch(e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
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

  Future<void> signout({
    required BuildContext context
  }) async {

    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>Login()
        )
    );
  }
}