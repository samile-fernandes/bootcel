import 'package:agrowebpragasdoencas/src/widgets/home/agroweb-nome2.dart';
import 'package:agrowebpragasdoencas/src/widgets/home/svg-screen-logo2.dart';
import 'package:flutter/material.dart';

class ImgBackground extends StatelessWidget {
  const ImgBackground({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            decoration:const  BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(90.0)),
              image: DecorationImage(
                image:  AssetImage('assets/images/welcome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: size.width,
            height: size.height * 0.55,
          ),
        ),
      const  SvgGreenLogo2(),
      const  AgrowebNome2()
      ],
    );
  }
}