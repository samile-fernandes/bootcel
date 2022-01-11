import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/morango.dart';
import 'package:flutter/material.dart';

class DataTableFutureBuildMorango extends StatefulWidget {
  const DataTableFutureBuildMorango({Key? key}) : super(key: key);

  @override
  _DataTableFutureBuildMorangoState createState() =>
      _DataTableFutureBuildMorangoState();
}

class _DataTableFutureBuildMorangoState
    extends State<DataTableFutureBuildMorango> {
      late Future<Morango> morango = Api.getMorango();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: FutureBuilder<Morango>(
          future: morango,
          builder: (context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xff5546E6)),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffC8D1D3)),
                columnSpacing: 2,
                columns: const [
                  DataColumn(
                    label: Text('nome',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text('unidade',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text('situação',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text('min',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text('mc',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text('max',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text('procedencia',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(asyncSnapshot.data.nome)),
                    DataCell(Text(asyncSnapshot.data.und)),
                    DataCell(Text(asyncSnapshot.data.sit == "ENT"
                        ? "entrada"
                        : asyncSnapshot.data.sit == "SINF"
                            ? "sem informação"
                            : asyncSnapshot.data.sit == "EST"
                                ? "estável"
                                : asyncSnapshot.data.sit == "FIR"
                                    ? "firme"
                                    : asyncSnapshot.data.sit == "FRA"
                                        ? "fraco"
                                        : asyncSnapshot.data.sit == "AUS"
                                            ? "ausente"
                                            : "")),
                    DataCell(Text(asyncSnapshot.data.min)),
                    DataCell(Text(asyncSnapshot.data.mc)),
                    DataCell(Text(asyncSnapshot.data.max)),
                    DataCell(Text(asyncSnapshot.data.procedencia)),
                  ]),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
