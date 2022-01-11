import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/model/pimentao.dart';
import 'package:flutter/material.dart';

class DataTableFutureBuildPimentao extends StatefulWidget {
  const DataTableFutureBuildPimentao({Key? key}) : super(key: key);

  @override
  _DataTableFutureBuildPimentaoState createState() =>
      _DataTableFutureBuildPimentaoState();
}

class _DataTableFutureBuildPimentaoState
    extends State<DataTableFutureBuildPimentao> {
  late Future<List<Pimentao>> pimentao = Api.getPimentao();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 830.0),
      child: Center(
        child: FutureBuilder<List<Pimentao>>(
          future: pimentao,
          builder: (context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              List<Pimentao> pimentao = asyncSnapshot.data;
              return DataTable(
                dataRowHeight: 40,
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
                rows: pimentao
                    .map((pimentao) => DataRow(cells: [
                          DataCell(Text(pimentao.nome.toLowerCase())),
                          DataCell(Text(pimentao.und.toLowerCase())),
                          DataCell(Text(pimentao.sit == "ENT"
                              ? "entrada"
                              : pimentao.sit == "SINF"
                                  ? "sem informação"
                                  : pimentao.sit == "EST"
                                      ? "estável"
                                      : pimentao.sit == "FIR"
                                          ? "firme"
                                          : pimentao.sit == "FRA"
                                              ? "fraco"
                                              : pimentao.sit == "AUS"
                                                  ? "ausente"
                                                  : "")),
                          DataCell(Text(pimentao.min.toLowerCase())),
                          DataCell(Text(pimentao.mc.toLowerCase())),
                          DataCell(Text(pimentao.max.toLowerCase())),
                          DataCell(Text(pimentao.procedencia.toLowerCase())),
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
