import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class TopProfileImage extends StatelessWidget {
  const TopProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 225,
        decoration: BoxDecoration(
            color: HexColor('#204289'),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(27.89),
              bottomRight: Radius.circular(27.89),
            )),
      ),
      Positioned(
        top: 48,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'svg_png/roojhWhite.svg',
                      // height: 42,
                      // width: 118,
                    ),
                    // SizedBox(width: 250),
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: CircleAvatar(
                        radius: 48,
                        // Image radius
                        backgroundImage: NetworkImage(
                            'https://source.unsplash.com/36x36/?girl'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          top: 100,
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  // width: double.infinity,
                  height: 165,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SvgPicture.asset('svg_png/profileBackground.svg')),
              Positioned(
                  top: 10,
                  left: 38,
                  // bottom: -1,
                  child: Container(
                    height: 148,
                    width: 142,
                    decoration: BoxDecoration(
                        color: HexColor('#E4EBFF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        )),
                    child: Column(children: [
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 72.14,
                        height: 72.14,
                        child: CircleAvatar(
                          radius: 48,
                          // Image radius
                          backgroundImage: NetworkImage(
                              'https://source.unsplash.com/72x72/?girl'),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Your Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 3),
                        height: 26,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {},
                          child: const Text('View Profile',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(244, 101, 36, 10))),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  HexColor('#FFFFFF')),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.9),

                                // side: BorderSide(color: Colors.red)
                              ))),
                        ),
                      ),
                    ]),
                  ))
            ],
          ))
    ]);
  }
}
