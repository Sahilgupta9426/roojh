import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:roojh/common_code/topImg.dart';
import 'package:roojh/local_storage/local_storage.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final _formKey = GlobalKey<FormState>();
  final LocalStorage securestorage = LocalStorage();
  var pin1 = "";
  var pin2 = "";
  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TopImagesField(),
            SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Create Pin',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: pin1Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a valid password';
                            }
                          }),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: pin2Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a valid password';
                            }
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            pin1 = pin1Controller.text;
                            pin2 = pin2Controller.text;
                            if (pin1 == pin2) {
                              securestorage.writeSecureData('pin1', pin1);
                              final snackBar = SnackBar(
                                  content:
                                      const Text('Pin Created SuccessFully'),
                                  action: SnackBarAction(
                                    label: 'Go back to enter pin',
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/auth");
                                      // Some code to undo the change.
                                    },
                                  ));

                              // Navigator.pushNamed(context, "/auth");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text('submit'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
