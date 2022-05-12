// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:roojh/Sign_up/main_sign_up.dart';

import 'package:roojh/homepage/home.dart';
import 'package:roojh/pin_password/bio_authpage.dart';
import 'package:roojh/pin_password/createpin.dart';

import 'Login_page/main_login.dart';

import 'forget_password/main_forgetpassword.dart';
// import 'homepage/bio_authpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StartPoint());
}

class StartPoint extends StatefulWidget {
  const StartPoint({Key? key}) : super(key: key);

  @override
  State<StartPoint> createState() => _StartPointState();
}

class _StartPointState extends State<StartPoint> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Roojh',
        home: Scaffold(body: SignIn(notify: '0')),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 249, 249)),
        routes: {
          "/login": (context) => SignIn(notify: '0'),
          "/forgetPass": (context) => ForgetPassword(),
          "/signup": (context) => SignUp(),
          "/home": (context) => Home(),
          "/auth": (context) => AuthPage(),
          "/createpin": (context) => CreatePin(),
        });
  }
}
