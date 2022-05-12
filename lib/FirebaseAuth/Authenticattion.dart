import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roojh/FirebaseAuth/cofirmation_code/email_confirmation.dart';
import 'package:roojh/Login_page/main_login.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:roojh/pin_password/bio_authpage.dart';

// firebase authentication
class FireAuth {
  final _auth = FirebaseAuth.instance;
  var user;
// sign in with email
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

// sign out
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

//sign up with email and password
  Future<String?> signUp(email, password, context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //if email is not verified  it redirect to verify page
      if (!_auth.currentUser!.emailVerified) {
        await checkEmailVerified(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifyEmail()));
      }
      //if user is verified
      else {
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

// check email verified
  Future<void> checkEmailVerified(context) async {
    if (_auth.currentUser != null) {
      await _auth.currentUser?.sendEmailVerification();
    }
  }

//user status check
  Future<void> userStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  // Login with Google
  Future<void> googleLogin(context) async {
    try {
      GoogleSignIn _googleSigIn = await GoogleSignIn(scopes: ['email']);
      final googleUser = await _googleSigIn.signIn();
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
}
