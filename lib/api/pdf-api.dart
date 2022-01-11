import 'dart:io';

import 'package:agrowebpragasdoencas/model/tree-culturas.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateTable(List<TreeCulturas> g) async {
    final pdf = Document();

    final headers = [
      'nome',
      'unidade',
      'situação',
      'Minimo',
      'Médio',
      'Maximo',
      'Procedencia'
    ];


    final data = g
        .map((pim) => [
              pim.nome.toLowerCase(),
              pim.und.toLowerCase(),
              pim.sit == "ENT"
                  ? "entrada"
                  : pim.sit == "SINF"
                      ? "sem informação"
                      : pim.sit == "EST"
                          ? "estável"
                          : pim.sit == "FIR"
                              ? "firme"
                              : pim.sit == "FRA"
                                  ? "fraco"
                                  : pim.sit == "AUS"
                                      ? "ausente"
                                      : "",
              pim.min.toLowerCase(),
              pim.mc.toLowerCase(),
              pim.max.toLowerCase(),
              pim.procedencia.toLowerCase()
            ])
        .toList();

    pdf.addPage(Page(
      build: (context) => Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'CotaçãoDiaria.pdf', pdf: pdf);
  }

 

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}