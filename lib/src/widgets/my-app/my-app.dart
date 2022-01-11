import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/cotacao-bell-piper.dart';
import 'package:agrowebpragasdoencas/model/cotacao-stramberry.dart';
import 'package:agrowebpragasdoencas/model/cotacao-tomato.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/button-text.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/description-home.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/home-message.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/img-background.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/svg-divider.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/svg-screen-logo.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/pest-and-diseases.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POSTADOR DE OFERTAS DO WHATSAPP',

      home: Scaffold(
        /*drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const PestDiseases();
                  }));
                },
                title: const Text("CADASTRO"),
              )
            ],
          ),
        ),*/
        appBar: AppBar(
          backgroundColor: Color(0xFF01086D),
          title: Center(
            child: Text(
              "BOTCEL",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF0E96CC),
        body: Container(
          width: double.infinity,
          child: Column(children: const <Widget>[
            DecriptionHome(),
            SizedBox(
              height: 20,
            ),
            ButtonText(),
            SizedBox(
              height: 20,
            ),
            ButtonText2(),
          ]),
        ),
      ),
      // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<CotacaoTomato>> priceMinTomato = Api.getPriceMinTomato();
  late Future<List<CotacaoStramberry>> priceStramberry =
      Api.getPriceStramberry();
  late Future<List<CotacaoBellPiper>> priceBellPiper = Api.getPriceBellPiper();
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: SizedBox(
          height: 200,
          width: 500,
          child: FutureBuilder<List<CotacaoBellPiper>>(
            future: priceBellPiper,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CotacaoBellPiper> priceMin = snapshot.data;
                return SfCartesianChart(
                  zoomPanBehavior: _zoomPanBehavior,
                  tooltipBehavior: _tooltipBehavior,
                  // Chart title text
                  title: ChartTitle(text: 'Cotação de preço Tomate'),
                  legend: Legend(isResponsive: true),
                  // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  backgroundColor: Colors.amber,
                  series: <CartesianSeries>[
                    // Initialize line series
                    LineSeries<CotacaoBellPiper, String>(
                      color: Colors.red,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Minimo",
                      xValueMapper: (CotacaoBellPiper details, _) =>
                          details.month,
                      yValueMapper: (CotacaoBellPiper details, _) =>
                          double.parse(details.priceMin),
                    ),
                    LineSeries<CotacaoBellPiper, String>(
                      color: Colors.blue,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Médio",
                      xValueMapper: (CotacaoBellPiper details, _) =>
                          details.month,
                      yValueMapper: (CotacaoBellPiper details, _) =>
                          double.parse(details.priceMc),
                    ),
                    LineSeries<CotacaoBellPiper, String>(
                      color: Colors.green,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Máximo",
                      xValueMapper: (CotacaoBellPiper details, _) =>
                          details.month,
                      yValueMapper: (CotacaoBellPiper details, _) =>
                          double.parse(details.priceMax),
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
    )));
  }
}
