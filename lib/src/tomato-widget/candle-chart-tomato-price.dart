import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/cotacao-tomato.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TomatoPriceVariation extends StatefulWidget {
  TomatoPriceVariation({Key? key}) : super(key: key);

  @override
  _TomatoPriceVariationState createState() => _TomatoPriceVariationState();
}

class _TomatoPriceVariationState extends State<TomatoPriceVariation> {
  late Future<List<CotacaoTomato>> priceTomato = Api.getPriceMinTomato();
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
          child: FutureBuilder<List<CotacaoTomato>>(
            future: priceTomato,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CotacaoTomato> priceMin = snapshot.data;
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
                    LineSeries<CotacaoTomato, String>(
                      color: Colors.red,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Minimo",
                      xValueMapper: (CotacaoTomato details, _) => details.month,
                      yValueMapper: (CotacaoTomato details, _) =>
                          double.parse(details.priceMin),
                    ),
                    LineSeries<CotacaoTomato, String>(
                      color: Colors.blue,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Médio",
                      xValueMapper: (CotacaoTomato details, _) => details.month,
                      yValueMapper: (CotacaoTomato details, _) =>
                          double.parse(details.priceMc),
                    ),
                    LineSeries<CotacaoTomato, String>(
                      color: Colors.green,
                      width: 5,
                      enableTooltip: true,
                      dataSource: priceMin,
                      name: "Preço Máximo",
                      xValueMapper: (CotacaoTomato details, _) => details.month,
                      yValueMapper: (CotacaoTomato details, _) =>
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
