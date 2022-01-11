import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SvgDivider extends StatelessWidget {
  const SvgDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 42.0, bottom: 0.0, right: 0.0),
      alignment: Alignment.bottomLeft,
      child: SvgPicture.string(
        '<svg viewBox="25.5 84.5 33.4 1.0" ><path transform="translate(25.5, 84.5)" d="M 0 0 L 33.41015625 0" fill="none" stroke="#ffffff" stroke-width="0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}