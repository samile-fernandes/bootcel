import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SvgGreenLogo extends StatelessWidget {
  const SvgGreenLogo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return Stack(
      children: <Widget>[
        Container(
          width: size.width * 0.90,
          height: size.height * 0.2,
          alignment: Alignment.center,
          child: SvgPicture.string(
            '<svg viewBox="0.0 0.0 83.2 83.2" ><path transform="translate(-0.03, -0.03)" d="M 82.55665588378906 39.46682357788086 L 42.55692672729492 0.6687728762626648 C 41.69855499267578 -0.1895909309387207 40.32518005371094 -0.1895909309387207 39.46682357788086 0.6687728762626648 L 0.6687728762626648 40.66852569580078 C -0.1895909309387207 41.52688980102539 -0.1895909309387207 42.90027236938477 0.6687728762626648 43.75863647460938 L 40.66852188110352 82.55665588378906 C 41.01186752319336 82.90000152587891 41.69855499267578 83.24336242675781 42.21357345581055 83.24336242675781 C 42.72859191894531 83.24336242675781 43.41528701782227 83.07168579101562 43.75862503051758 82.55665588378906 L 82.55665588378906 42.55692672729492 C 82.90000152587891 42.21357345581055 83.24336242675781 41.52688980102539 83.24336242675781 41.01186752319336 C 83.24336242675781 40.32518005371094 83.07168579101562 39.81016540527344 82.55665588378906 39.46682357788086 Z M 42.21358489990234 78.09318542480469 L 5.132264614105225 42.21358489990234 L 41.01186752319336 5.132264614105225 L 78.09318542480469 41.01186752319336 L 42.21358489990234 78.09318542480469 Z" fill="#43ff58" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: size.width * 0.85,
          height: size.height * 0.2,
          alignment: Alignment.center,
          child: SvgPicture.string(
            '<svg viewBox="15.8 30.0 25.8 26.3" ><path transform="translate(15.76, 30.01)" d="M 22.7136287689209 0 L 12.923828125 9.871856689453125 L 9.69287109375 6.58123779296875 L 6.898598670959473 9.45556640625 L 0 16.55181312561035 L 3.23095703125 19.84243202209473 L 9.69287109375 13.1624755859375 L 12.923828125 16.45309448242188 L 25.84765625 3.290618896484375 L 22.7136287689209 0 Z M 0 26.324951171875 L 25.84765625 23.03433227539062 L 0 26.324951171875 Z" fill="#43ff58" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: size.width * 0.52,
          height: size.height * 0.2,
          alignment: Alignment.centerRight,
          child: SvgPicture.string(
            '<svg viewBox="36.9 30.0 25.8 26.3" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 62.77, 56.33)" d="M 22.7136287689209 0 L 12.923828125 9.871856689453125 L 9.69287109375 6.58123779296875 L 6.898598670959473 9.45556640625 L 0 16.55181312561035 L 3.23095703125 19.84243202209473 L 9.69287109375 13.1624755859375 L 12.923828125 16.45309448242188 L 25.84765625 3.290618896484375 L 22.7136287689209 0 Z M 0 26.324951171875 L 25.84765625 23.03433227539062 L 0 26.324951171875 Z" fill="#43ff58" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}