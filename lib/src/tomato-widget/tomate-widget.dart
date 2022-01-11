import 'package:agrowebpragasdoencas/src/stramberry-widget/morango-widget.dart';
import 'package:agrowebpragasdoencas/src/tomato-widget/candle-chart-tomato-price.dart';
import 'package:agrowebpragasdoencas/src/tomato-widget/web-view-doencas-tomate.dart';
import 'package:agrowebpragasdoencas/src/tomato-widget/web-view-pragas-tomate.dart';
import 'package:flutter/material.dart';

class TomateWidget extends StatefulWidget {
  const TomateWidget({Key? key}) : super(key: key);
  @override
  _TomateWidgetState createState() => _TomateWidgetState();
}

class _TomateWidgetState extends State<TomateWidget> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageScreen(WebViewPragasTomate()),
    NewPageScreen(WebViewDoencasTomate()),
    NewPageScreen(TomatoPriceVariation())
  ];
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* home: DefaultTabController(
        length: 2,
        child:*/
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: const Color(0xffF0F3F4),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'AgroWeb ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 24,
                    color: Color(0xff010101),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  "assets/images/headerLogo.png",
                  fit: BoxFit.contain,
                  height: 32,
                )
              ],
            ),
          ),
          /*bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor:  Color(0xff41E62E),
              tabs: [
                Text("Pragas"),
                Text("Doenças"),
              ],
            ),*/
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: onTabTapped,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.bug_report_rounded), title: Text("Pragas")),
            BottomNavigationBarItem(
                icon: Icon(Icons.blur_circular), title: Text("Doenças")),
                 BottomNavigationBarItem(icon: Icon(Icons.price_change), title:  Text("Cotação de Preço"))
          ],
        ),
        /* body: const TabBarView(
            children: [WebViewPragasTomate(), WebViewDoencasTomate()],
          ),*/
        body: _telas[_indiceAtual],
      ),
    );
  }
}
