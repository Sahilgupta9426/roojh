import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Sign_up/main_sign_up.dart';

//text button which redirect in 'sign up page'
class Create_Acoount extends StatelessWidget {
  const Create_Acoount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New here?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          TextButton(
            onPressed: () {
              // Navigator.pushNamed(context, "/signup");
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SignUp(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.easeOutCubic);
                      return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                  ));
            },
            child: Text('Create Account',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#F46524'))),
          ),
        ],
      ),
    );
  }
}
