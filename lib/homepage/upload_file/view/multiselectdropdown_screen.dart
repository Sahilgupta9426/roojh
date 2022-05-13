import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:roojh/homepage/upload_file/controller/app_data_controller.dart';
import 'package:roojh/homepage/upload_file/model/subject_data_model.dart';
import 'package:roojh/homepage/upload_file/upload_main.dart';

class MultiSelectDropDownScreen extends StatefulWidget {
  MultiSelectDropDownScreen({Key? key}) : super(key: key);

  @override
  State<MultiSelectDropDownScreen> createState() =>
      _MultiSelectDropDownScreenState();
}

class _MultiSelectDropDownScreenState extends State<MultiSelectDropDownScreen> {
  final AppDataController controller = Get.put(AppDataController());

  @override
  Widget build(BuildContext context) {
    List subjectData = [];

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });

    final summeryController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Upload Document',
                          style: TextStyle(fontSize: 19),
                        )),
                    SizedBox(height: 120),
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
                        ),
                      ),
                    ),
                    GetBuilder<AppDataController>(builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30.0, top: 0, left: 0, right: 0),
                        child: MultiSelectDialogField(
                          items: controller.dropDownData,
                          title: const Text(
                            "Select Tests",
                            style: TextStyle(color: Colors.black),
                          ),
                          selectedColor: Colors.black,
                          decoration: BoxDecoration(
                            color: HexColor('#F3F6FF'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                              color: HexColor('#CED3E1'),
                              width: 1,
                            ),
                          ),
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          buttonText: const Text(
                            "   Document Type",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          onConfirm: (results) {
                            subjectData = [];
                            for (var i = 0; i < results.length; i++) {
                              SubjectModel data = results[i] as SubjectModel;
                              print(data.subjectId);
                              print(data.subjectName);
                              subjectData.add(data.subjectId);
                            }
                            print("data $subjectData");

                            //_selectedAnimals = results;
                          },
                        ),
                      );
                    }),
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
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
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
                          if (_formKey.currentState!.validate()) {}
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
