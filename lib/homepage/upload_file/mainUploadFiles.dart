import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roojh/homepage/upload_file/view/moreUpload.dart';
import '../../FirebaseAuth/firebase_storage/firebase_storage.dart';
import '../../common_code/profileTopImage.dart';

// #######################################
// main upload file page where you will upload pdf from library and capture image to upload firebase storage
class MainUploadFiles extends StatefulWidget {
  const MainUploadFiles({
    Key? key,
  }) : super(key: key);

  @override
  State<MainUploadFiles> createState() => _MainUploadFilesState();
}

class _MainUploadFilesState extends State<MainUploadFiles> {
  final user = FirebaseAuth.instance.currentUser; // get user details
  FirebaseStorage _storageRef =
      FirebaseStorage.instance; //firebase storage intance
  // ##############################
  // this function provide to get image by capture through mobile camera
  late File _image;
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    // if image is not selected then it will return null
    if (image == null) return;
    // ###########################
    // if image captured
    var filename = image.name; //get image name
    // print('file name--- $filename');
    // final imageTemporary = await File(image.path);
    // print('file name--- $imageTemporary');
    // setState(() {
    //   // this._image = imageTemporary;
    // });

    if (image != null) {
      // ############################
      //upload image function called after capturing image
      await uploadImage(image);
    }
  }

// ##############################
// this function upload the image after capturing the image
  Future<void> uploadImage(XFile _image) async {
    Reference reference =
        _storageRef.ref().child('${user?.email}').child(_image.name);
    UploadTask uploadTask = reference.putFile(File(_image.path));
    // ################################################
    // it will show uploading notification on screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          backgroundColor: Colors.black,
          duration: Duration(seconds: 5),
          content: Text('Uploading')),
    );
    // ##################################
    // when upload is successful then it will show a notification that upload successful
    await uploadTask.whenComplete(() {
      print(reference.getDownloadURL());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.black,
            duration: Duration(seconds: 2),
            content: Text('Upload Successful')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TopProfileImage(), //it wil show user picture and name which is in common code folder
      Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 47, right: 47),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Please upload your document to get\n             your dashboard ready',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ############################
                  // File upload button
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MoreUploads()));
                      },
                      child: SvgPicture.asset('icons/fileupload2.svg')),
                  // ############################
                  // Capture image button
                  TextButton(
                      onPressed: () async {
                        await getImage(); //calling getimage function which will capture image and ulpad to storage
                      },
                      child: SvgPicture.asset('icons/uploadImage.svg'))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 129,
          ),
          Container(
            height: 51.8,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {},
              child: const Text('View Sample Profile',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(244, 101, 36, 10))),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor('#FEF0E9')),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.9),

                    // side: BorderSide(color: Colors.red)
                  ))),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ]);
  }
}
