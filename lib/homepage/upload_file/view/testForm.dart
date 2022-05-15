// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/homepage/upload_file/upload_main.dart';
import 'dart:async';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class TestForm extends StatefulWidget {
  TestForm({Key? key}) : super(key: key);

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  String? selecTest;
  final auth = FirebaseAuth.instance.currentUser;
  // ##############################
  //For Date form
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<firebase_storage.UploadTask?> uploadFile(File file) async {
    if (file == null) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Unable to Upload")));
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('${auth?.email}')
        .child('/$selecTest.pdf');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    print("done..!");
    return Future.value(uploadTask);
  }

  late File file;
  firebase_storage.UploadTask? task;
  @override
  Widget build(BuildContext context) {
    final summeryController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 28,
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: SvgPicture.asset('icons/exitCross.svg'),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MainUploadFile()));
                    },
                  )),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    // ######################
                    // upload ducumet heading
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Upload Document',
                          style: TextStyle(fontSize: 19),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () async {
                          final path =
                              await FlutterDocumentPicker.openDocument();
                          print(path);
                          file = await File(path!);
                        },
                        child: SvgPicture.asset('icons/fileupload2.svg')),
                    SizedBox(height: 40),
                    // ######################
                    // Document type drop down form
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 7, bottom: 2),
                          child: Text(
                            'Document Type',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor('#F3F6FF'),
                        borderRadius: BorderRadius.circular(98),
                        border: Border.all(color: HexColor('#CED3E1')),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Color(0xffeeeeee),
                        //       blurRadius: 10,
                        //       offset: Offset(0, 4),
                        //     ),
                        //   ],
                      ),
                      height: 51,
                      padding: EdgeInsets.only(left: 18, right: 18),
                      // width: double.infinity,
                      child: DropdownButton<String>(
                        underline: Container(),
                        isExpanded: true,
                        hint: selecTest == null
                            ? Text('Document Type')
                            : Text('$selecTest'),
                        items: <String>[
                          'Lab',
                          'Medication',
                          'Vitals',
                          'Problems',
                          'Radiology',
                          'Cardiology'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() async {
                            selecTest = await value!;
                          });
                        },

                        // autofocus: true,
                        value: selecTest,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // #########################
                    // For summery form
                    TextFormField(
                      minLines: null,
                      maxLines: 8,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor('#F3F6FF'),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Summery",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: HexColor('#CED3E1'),
                            // width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: HexColor('#CED3E1'),
                            width: 1.0,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      controller: summeryController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Summery';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // ######################
                    // Select date
                    Container(
                      height: 51,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor('#F3F6FF'),
                        borderRadius: BorderRadius.circular(98),
                        border: Border.all(color: HexColor('#CED3E1')),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Color(0xffeeeeee),
                        //       blurRadius: 10,
                        //       offset: Offset(0, 4),
                        //     ),
                        //   ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              // style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 18),
                            child: TextButton(
                              onPressed: () => _selectDate(context),
                              child: Text('Select date'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // ##################################
                    // Submit button
                    Container(
                      height: 51,
                      // width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                HexColor('#F46524')),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),

                              // side: BorderSide(color: Colors.red)
                            ))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() async {
                              print(selecTest);
                              task = await uploadFile(file);
                            });
                          }
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
