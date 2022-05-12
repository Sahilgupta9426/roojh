import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopImagesField extends StatelessWidget {
  const TopImagesField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.loose,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 225,
          decoration: BoxDecoration(
              color: HexColor('#F3F6FF'),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(27.89),
                bottomRight: Radius.circular(27.89),
              )),
        ),
        Positioned(
          left: 27,
          top: 48,
          child: SvgPicture.asset(
            'svg_png/roojh_logo.svg',
            // height: 42,
            // width: 118,
          ),
        ),
        Positioned(
            bottom: -24,
            left: 126,
            // right: 80,
            child: new Image.asset(
              'svg_png/Frame.png',
              height: 163,
              // width: 145,
              // width: MediaQuery.of(context).size.width,
            )),
      ],
    );
  }
}
