import 'package:agrowebpragasdoencas/data/cultures-data.dart';
import 'package:agrowebpragasdoencas/model/culturas.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/search-widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarrosselWidget extends StatefulWidget {
  const CarrosselWidget({Key? key}) : super(key: key);
  @override
  _CarrosselWidgetState createState() => _CarrosselWidgetState();
}

class _CarrosselWidgetState extends State<CarrosselWidget> {
  int activeIndex = 0;
  String query = '';
  late List<Culturas> cultures;
  Widget buildImage(String img, String culturas, String imgOval, Widget widget,
          int index) =>
      Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.fitWidth,
                ),
                color: const Color(0x00c8d1d3),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1a1b1c20),
                    offset: Offset(0, 10),
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150.0),
              alignment: Alignment.centerRight,
              height: 80,
              width: 80,
              child: ClipOval(
                child: Image.asset(
                  imgOval,
                  fit: BoxFit.contain,
                  height: 40,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                culturas,
                style: const TextStyle(
                  fontFamily: 'Europa',
                  fontSize: 15,
                  color: Color(0xff334856),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget),
                ),
              },
            )
          ],
        ),
      );
  @override
  void initState() {
    super.initState();
    cultures = AllCulturas;
  }

  void searchCulturas(String query) {
    final cultura = AllCulturas.where((culturas) {
      final nome = culturas.nome;
      final search = query;
      return nome.contains(search);
    }).toList();
    setState(() {
      this.query = query;
      cultures = cultura;
    });
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Pesquise a cultura',
        //   onChanged: searchCulturas,
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: cultures.length,
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearch(),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 240,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: cultures.length,
          itemBuilder: (context, index, realIndex) {
            final img = cultures[index].images;
            final cult = cultures[index].nome;
            final imgOval = cultures[index].ovalImages;
            final widget = cultures[index].link;
            return buildImage(img, cult, imgOval, widget, index);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        buildIndicator(),
      ],
    );
  }
}
