import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/data.dart';
import 'package:flutter/material.dart';

class DataFutureBuildWidget extends StatefulWidget {
  const DataFutureBuildWidget({Key? key}) : super(key: key);

  @override
  _DataFutureBuildWidgetState createState() => _DataFutureBuildWidgetState();
}

class _DataFutureBuildWidgetState extends State<DataFutureBuildWidget> {
    late Future<Data> data = Api.getData();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80.0),
      padding: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 1010.67,
      color: const Color(0xff5546E6),
      child: FutureBuilder<Data>(
        future: data,
        builder: (context, AsyncSnapshot asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return Text(
              "Cotação de preço diário de ${asyncSnapshot.data.data}",
              style:  const TextStyle(
                fontFamily: 'Europa',
                fontSize: 16,
                color:  Color(0xffffffff),
                height: 2.0833333333333335,
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}
