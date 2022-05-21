import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roojh/homepage/upload_file/upload_main.dart';
import '../../FirebaseAuth/firebase_storage/firebase_storage.dart';
import '../../common_code/profileTopImage.dart';

// class Footer extends StatefulWidget {
//   const Footer({Key? key}) : super(key: key);

//   @override
//   State<Footer> createState() => _FooterState();
// }

// class _FooterState extends State<Footer> {
//   int currentIndex = 0;
//   bool onSelected = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           // fixedColor: Colors.black,
//           // iconSize: 35,

//           selectedLabelStyle:
//               TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//           selectedItemColor: HexColor('#204289'),
//           showUnselectedLabels: false,
//           currentIndex: currentIndex,
//           onTap: (index) => setState(() => currentIndex = index),
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_filled),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.health_and_safety_rounded),
//               label: 'Trends',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.medical_services),
//               label: 'Medication',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.biotech),
//               label: 'Reports',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.folder),
//               label: 'Docs',
//             )
//           ]),
//       body: SingleChildScrollView(
//         child: UploadProfile(),
//       ),
//     );
//   }
// }

class UploadProfile extends StatefulWidget {
  const UploadProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  late File _image;
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    var filename = image.name;
    print('file name--- $filename');
    final imageTemporary = await File(image.path);
    print('file name--- $imageTemporary');
    setState(() {
      this._image = imageTemporary;
    });
    if (image != null) {
      print('file name_____--- $_image');
      await uploadImage(image);
    }
  }

  Future<void> uploadImage(XFile _image) async {
    Reference reference =
        _storageRef.ref().child('${user?.email}').child(_image.name);
    UploadTask uploadTask = reference.putFile(File(_image.path));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          backgroundColor: Colors.black,
          duration: Duration(seconds: 5),
          content: Text('Uploading')),
    );
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
      TopProfileImage(),
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
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainUploadFile()));
                      },
                      child: SvgPicture.asset('icons/fileupload2.svg')),
                  // SizedBox(
                  //   width: 18,
                  // ),
                  TextButton(
                      onPressed: () async {
                        await getImage();
                      },
                      child: SvgPicture.asset('icons/uploadImage.svg'))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 129,
          ),
          // Image.file(_image),
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
