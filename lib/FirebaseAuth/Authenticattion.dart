import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roojh/FirebaseAuth/cofirmation_code/email_confirmation.dart';
import 'package:roojh/Login_page/main_login.dart';
import 'package:roojh/homepage/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roojh/pin_password/bio_authpage.dart';

class FireAuth {
  final _auth = FirebaseAuth.instance;
  var user;

  Future<String?> signIn(String email, String password, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        user = _auth.currentUser?.email;
        if (!_auth.currentUser!.emailVerified) {
          await _auth.currentUser?.sendEmailVerification();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => VerifyEmail()));
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AuthPage()),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signout(context) async {
    try {
      await _auth
          .signOut()
          .then((value) async => await _auth.currentUser?.reload());
      // await _auth.currentUser?.reload();
      print('sign out $_auth');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignIn(notify: '0')),
      );
    } on FirebaseAuthException catch (e) {
      print('sign out error');
      print(e.message);
    }
  }

  Future<String?> signUp(email, password, context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await checkEmailVerified(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifyEmail()));
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignIn(notify: '1')),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Sign up error');
      print(e.message);
      return e.message;
    }
  }

  Future<void> checkEmailVerified(context) async {
    if (_auth.currentUser != null) {
      await _auth.currentUser?.sendEmailVerification();
    }
  }

  Future<void> userStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  // social login
  Future<void> googleLogin(context) async {
    try {
      GoogleSignIn _googleSigIn = await GoogleSignIn(scopes: ['email']);
      await _googleSigIn.signIn();
      GoogleSignInAccount? user = await _googleSigIn.currentUser;
      print('User is signed in! $user');
      if (user != null) {
        print('User is signed in!');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AuthPage()),
        );
      }
    } catch (e) {
      print('error-');
    }
  }

  Future<void> userCurrentState() async {
    user = await _auth.currentUser;
  }
}