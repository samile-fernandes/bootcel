import 'package:flutter/material.dart';

class DescriptionWelcome extends StatelessWidget {
  const DescriptionWelcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        'A melhor estratégica para  ajudar a diagnosticar pragas e doenças no Campo. Vamos começar!',
        style: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      color: Color(0xfff4f5f8),
      height: 1.4285714285714286,
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.center,
      ),
    );
  }
}