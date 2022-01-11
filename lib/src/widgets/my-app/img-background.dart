
import 'package:agrowebpragasdoencas/src/widgets/my-app/agroweb-nome.dart';
import 'package:flutter/material.dart';

class ImgBackGround extends StatelessWidget {
  const ImgBackGround({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('assets/images/Imagem1.png'),
              fit: BoxFit.fill,
            ),
          ),
          width: size.width,
          height: size.height * 0.35,
        ),
       const AgrowebNome(),
      ],
    );
  }
}