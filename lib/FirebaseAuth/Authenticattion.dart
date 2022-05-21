import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roojh/FirebaseAuth/cofirmation_code/email_confirmation.dart';
import 'package:roojh/Login_page/main_login.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:roojh/pin_password/bio_authpage.dart';

// firebase authentication which will provide sign up, sign in ,sign out, login with google
class FireAuth {
  final _auth = FirebaseAuth.instance;
  var user;
// sign in with email function
  Future<String?> signIn(String email, String password, context) async {
    try {
      // if user logged in succesful
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        user = _auth.currentUser?.email;
        // if user's email is not authenticate then it will send verification email which will confirm the email
        if (!_auth.currentUser!.emailVerified) {
          await _auth.currentUser?.sendEmailVerification();
          // redirect to the verifyemail page if user's email not confirmed
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => VerifyEmail()));
        } else {
          // if user's email is already confirmed then it will redirect to pin password and biometric authentication page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AuthPage()),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      //get error message if there anthing wrong while signing in
      return e.message;
    }
  }

// sign out function
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
      // else {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => SignIn(notify: '1')),
      //   );
      // }
    } on FirebaseAuthException catch (e) {
      print('Sign up error');
      print(e.message);
      return e.message;
    }
  }

// check email verified if not it will resend the verfication link
  Future<void> checkEmailVerified(context) async {
    if (_auth.currentUser != null) {
      await _auth.currentUser?.sendEmailVerification();
    }
  }

// //user status check
//   Future<void> userStatus() async {
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         print('User is currently signed out!');
//       } else {
//         print('User is signed in!');
//       }
//     });
//   }

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
