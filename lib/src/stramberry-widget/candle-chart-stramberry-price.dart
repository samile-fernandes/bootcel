import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/cotacao-stramberry.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StramberryPriceVariation extends StatefulWidget {
  StramberryPriceVariation({Key? key}) : super(key: key);

  @override
  _StramberryPriceVariationState createState() =>
      _StramberryPriceVariationState();
}

class _StramberryPriceVariationState extends State<StramberryPriceVariation> {
  late Future<List<CotacaoStramberry>> priceStramberry =
      Api.getPriceStramberry();
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
          child: FutureBuilder<List<CotacaoStramberry>>(
            future: priceStramberry,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CotacaoStramberry> priceMin = snapshot.data;
                return SfCartesianChart(
                  zoomPanBehavior: _zoomPanBehavior,
                  tooltipBehavior: _tooltipBehavior,
                  // Chart title text
                  title: ChartTitle(text: 'Cotação de preço Morango'),
                  legend: Legend(isResponsive: true),
                  // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  backgroundColor: Colors.amber,
                  series: <CartesianSeries>[
                    // Initialize line series
                    LineSeries<CotacaoStramberry, String>(
                      color: Colors.red,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Minimo",
                      xValueMapper: (CotacaoStramberry details, _) =>
                          details.month,
                      yValueMapper: (CotacaoStramberry details, _) =>
                          double.parse(details.priceMin),
                    ),
                    LineSeries<CotacaoStramberry, String>(
                      color: Colors.blue,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Médio",
                      xValueMapper: (CotacaoStramberry details, _) =>
                          details.month,
                      yValueMapper: (CotacaoStramberry details, _) =>
                          double.parse(details.priceMc),
                    ),
                    LineSeries<CotacaoStramberry, String>(
                      color: Colors.green,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Máximo",
                      xValueMapper: (CotacaoStramberry details, _) =>
                          details.month,
                      yValueMapper: (CotacaoStramberry details, _) =>
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
