import 'package:flutter/material.dart';

class HomeMessage extends StatelessWidget {
  const HomeMessage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(20.0),
      child: Text(
        'Orientação e analise integrada na prática!',
        style: TextStyle(
          fontFamily: 'Europa',
          fontSize: 18,
          color:  Color(0xffffffff),
          height: 1.3888888888888888,
        ),
        textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.left,
      ),
    );
  }
}