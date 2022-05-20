import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../common_code/profileTopImage.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          // fixedColor: Colors.black,
          // iconSize: 34,
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
        child: Column(children: [
          TopProfileImage(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
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
                        SvgPicture.asset('icons/fileupload2.svg'),
                        // SizedBox(
                        //   width: 18,
                        // ),
                        SvgPicture.asset('icons/uploadImage.svg')
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
                            fontSize: 20,
                            color: Color.fromRGBO(244, 101, 36, 10))),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            HexColor('#FEF0E9')),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
          ),
        ]),
      ),
    );
  }
}
