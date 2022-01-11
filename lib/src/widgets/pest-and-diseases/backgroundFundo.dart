import 'package:flutter/material.dart';

class BackgroundFundo extends StatelessWidget {
  const BackgroundFundo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [Color(0xff5546e6), Color(0xff2b2373)],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Descobrir as\nPragas e Doenças teste',
            style: TextStyle(
              fontFamily: 'Europa',
              fontSize: 30,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w700,
              height: 1.0666666666666667,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          transform: Matrix4.identity()..translate(69.5, 10.0),
          width: 50.0,
          child: const Divider(
            color: Colors.white,
            height: 160,
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          transform: Matrix4.identity()..translate(60.0, 100.0),
          child: const Text(
            'Descubra os tipos de pragas e doenças abaixo:',
            style: TextStyle(
              fontFamily: 'Europa',
              fontSize: 12,
              color: Color(0xffffffff),
              height: 2.0833333333333335,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
