import 'package:flutter/material.dart';

class TextSimple extends StatelessWidget {
  const TextSimple({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Materiais Didático',
      style: TextStyle(
        fontFamily: 'Europa',
        fontSize: 18,
        color: Color(0xff162e13),
        fontWeight: FontWeight.w700,
        height: 1.9444444444444444,
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.center,
    );
  }
}
