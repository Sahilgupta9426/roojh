import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:roojh/FirebaseAuth/Authenticattion.dart';

import 'package:roojh/common_code/topImg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;
  var finalusername = "";

  //2nd part
  DateTime? lastpresed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async {
            final now = DateTime.now();
            final maxDuration = Duration(seconds: 2);
            final isWarning =
                lastpresed == null || now.difference(lastpresed!) > maxDuration;
            if (isWarning) {
              lastpresed = DateTime.now();
              final snackBar = SnackBar(
                content: Text('Double Tap To Close'),
                duration: maxDuration,
              );
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackBar);
              return false;
            } else {
              return true;
            }
          },
          child: Column(
            children: [
              TopImagesField(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(
                      'Hello ($user.email) ',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            FireAuth().signout(context);
                          },
                          child: Text('logout')),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
