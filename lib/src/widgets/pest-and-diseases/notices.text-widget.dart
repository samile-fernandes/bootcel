import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoticesTextWidget extends StatelessWidget {
  const NoticesTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 213,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50),
              child: SvgPicture.string(
                '<svg viewBox="-0.1 17.9 375.9 212.4" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff5546e6"  /><stop offset="1.0" stop-color="#ff2b2373"  /></linearGradient></defs><path transform="translate(3.99, -4783.1)" d="M 371.8428344726562 5013.330078125 C 371.8428344726562 5013.330078125 254.9975280761719 4980.83984375 168.242431640625 4979.052734375 C 81.48738098144531 4977.26513671875 -4.073788642883301 4994.701171875 -4.073788642883301 4994.701171875 L -4.073788642883301 4800.9599609375 L 371.8428344726562 4800.9599609375 L 371.8428344726562 5013.330078125 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.string(
                  '<svg viewBox="-73.3 -7.8 507.0 161.5" ><path transform="translate(624.79, -543.99)" d="M -697.87744140625 536.199951171875 C -698.0227661132812 538.3551635742188 -698.0999145507812 540.5209350585938 -698.0999145507812 542.697998046875 C -698.0999145507812 628.3243408203125 -584.604248046875 697.7384033203125 -444.6004028320312 697.7384033203125 C -304.5963745117188 697.7384033203125 -191.100830078125 628.3243408203125 -191.100830078125 542.697998046875 C -191.100830078125 540.5209350585938 -191.1780090332031 538.3551635742188 -191.3233642578125 536.199951171875 L -697.87744140625 536.199951171875 Z" fill="#c8d1d3" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
            Container(
              padding: const EdgeInsets.only(bottom: 125),
              alignment: Alignment.center,
              child: const Text(
                'Boletim Diário de Preços',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 28,
                  color: Color(0xff162e13),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.only(top: 65),
              alignment: Alignment.topCenter,
              child: const Text(
                'Os preços diários corresponde a cultura do Tomate, Pimentão e Morango, apresentado na Ceasa- CE, caso deseje saber os demais cultivo clique no\n botão a baixo.  ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: Color(0xff162e13),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
