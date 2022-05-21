import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../homepage/upload_file/mainUploadFiles.dart';

// it's a bottum  navigation which will switch pages by click on buttons,Like main upload files,Trends page,Medication page,Reports page and Documents.
// By default it will open by default mainuploadfiles
class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int currentIndex = 0;
  bool onSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //navigation button
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          // fixedColor: Colors.black,
          // iconSize: 35,

          selectedLabelStyle:
              TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          selectedItemColor: HexColor('#204289'),
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_rounded),
              label: 'Trends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'Medication',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.biotech),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Docs',
            )
          ]),
      body: SingleChildScrollView(
        child: MainUploadFiles(),
      ),
    );
  }
}
