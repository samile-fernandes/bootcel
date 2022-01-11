// ignore_for_file: prefer_const_constructors

import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/tomate.dart';
import 'package:flutter/material.dart';

class DataTableFutureBuildTomate extends StatefulWidget {
  const DataTableFutureBuildTomate({Key? key}) : super(key: key);

  @override
  _DataTableFutureBuildTomateState createState() =>
      _DataTableFutureBuildTomateState();
}

class _DataTableFutureBuildTomateState
    extends State<DataTableFutureBuildTomate> {
  late Future<List<Tomate>> tomate = Api.getTomate();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 270.0),
      child: Center(
        child: FutureBuilder<List<Tomate>>(
          future: tomate,
          builder: (context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              List<Tomate> tomate = asyncSnapshot.data;
              return DataTable(
                dataRowHeight: 50,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xff5546E6)),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffC8D1D3)),
                columnSpacing: 1,
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
                rows: tomate
                    .map((tomato) => DataRow(cells: [
                          DataCell(Text(tomato.nome.toLowerCase())),
                          DataCell(Text(tomato.und.toLowerCase())),
                          DataCell(Text(tomato.sit == "ENT"
                              ? "entrada"
                              : tomato.sit == "SINF"
                                  ? "sem informação"
                                  : tomato.sit == "EST"
                                      ? "estável"
                                      : tomato.sit == "FIR"
                                          ? "firme"
                                          : tomato.sit == "FRA"
                                              ? "fraco"
                                              : tomato.sit == "AUS"
                                                  ? "ausente"
                                                  : "")),
                          DataCell(Text(tomato.min.toLowerCase())),
                          DataCell(Text(tomato.mc.toLowerCase())),
                          DataCell(Text(tomato.max.toLowerCase())),
                          DataCell(Text(tomato.procedencia.toLowerCase())),
                        ]))
                    .toList(),
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
