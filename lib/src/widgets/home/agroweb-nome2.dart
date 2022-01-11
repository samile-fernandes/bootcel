import 'package:flutter/material.dart';

class AgrowebNome2 extends StatelessWidget {
  const AgrowebNome2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()..translate(0.0, 200.0),
      child:const  Center(
        child: Text(
          'AgroWeb',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 64,
            color:  Color(0xff000000),
            shadows: [
              Shadow(
                color:  Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              )
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}