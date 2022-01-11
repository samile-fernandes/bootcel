import 'package:flutter/material.dart';

class AgrowebNome extends StatelessWidget {
  const AgrowebNome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Text(
        'AgroWeb',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 64,
          color: Color(0xffffffff),
          shadows: [
            Shadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            )
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}