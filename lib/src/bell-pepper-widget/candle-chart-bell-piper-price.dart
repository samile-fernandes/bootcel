import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/cotacao-bell-piper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BellPiperPriceVariation extends StatefulWidget {
  BellPiperPriceVariation({Key? key}) : super(key: key);

  @override
  _BellPiperPriceVariationState createState() =>
      _BellPiperPriceVariationState();
}

class _BellPiperPriceVariationState extends State<BellPiperPriceVariation> {
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
    return SafeArea(
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
                  title: ChartTitle(text: 'Cotação de preço Pimentão'),
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
    );
  }
}
