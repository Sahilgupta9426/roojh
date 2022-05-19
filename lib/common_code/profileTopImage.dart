import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class TopProfileImage extends StatelessWidget {
  const TopProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 230,
        decoration: BoxDecoration(
            color: HexColor('#204289'),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(27.89),
              bottomRight: Radius.circular(27.89),
            )),
      ),
      Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      Positioned(
          top: 100,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // width: double.infinity,
                height: 170,
                padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Container(
                  padding: EdgeInsets.all(0),
                  // height: 170,

                  decoration: BoxDecoration(
                      color: HexColor('#C4D0F1'),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 133, right: 3),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: () {},
                              child: SvgPicture.asset('icons/addmember.svg')),
                        ]),
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  left: 30,
                  // bottom: -1,
                  child: Container(
                    height: 154,
                    width: 148,
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
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                                  fontSize: 13,
                                  color: Color.fromRGBO(32, 66, 137, 1),
                                  fontWeight: FontWeight.w500)),
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
