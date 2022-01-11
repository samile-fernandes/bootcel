import 'package:agrowebpragasdoencas/model/culturas.dart';
import 'package:agrowebpragasdoencas/src/bell-pepper-widget/pimentao-widget.dart';
import 'package:agrowebpragasdoencas/src/stramberry-widget/morango-widget.dart';
import 'package:agrowebpragasdoencas/src/tomato-widget/tomate-widget.dart';


// ignore: non_constant_identifier_names
final List<Culturas> AllCulturas = <Culturas>[
  const Culturas(
      images: "assets/images/backgroundStramberry.png",
      nome: "Morango",
      ovalImages: "assets/images/strawberryoval.png",
      link: MorangoWidget()),
  const Culturas(
      images: "assets/images/backgroundTomato.png",
      nome: "Tomate",
      ovalImages: "assets/images/tomatoOval.png",
      link: TomateWidget()),
  const Culturas(
      images: "assets/images/backgroundPiment.png",
      nome: "Pimentão",
      ovalImages: "assets/images/pimentOval.png",
      link: PimentaoWidget()),
];
