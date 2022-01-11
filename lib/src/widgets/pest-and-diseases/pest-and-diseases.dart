import 'package:agrowebpragasdoencas/api/api.dart';
import 'package:agrowebpragasdoencas/api/pdf-api.dart';
import 'package:agrowebpragasdoencas/model/tree-culturas.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/backgroundFundo.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/button-ceasa.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/button-widget.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/carousel-widget.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table-build.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/notices.text-widget.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/text-simple.dart';
import 'package:flutter/material.dart';

class PestDiseases extends StatefulWidget {
  const PestDiseases({Key? key}) : super(key: key);
  @override
  State<PestDiseases> createState() => _PestDiseasesState();
}

class _PestDiseasesState extends State<PestDiseases> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffF0F3F4),
        appBar: AppBar(
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
        ),
        body: SizedBox(
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              BackgroundFundo(),
              TextSimple(),
              CarrosselWidget(),
              NoticesTextWidget(),
              DataTableBuild(),
              DownloadPdf(),
              ButtonCeasa(),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadPdf extends StatefulWidget {
  const DownloadPdf({Key? key}) : super(key: key);

  @override
  _DownloadPdfState createState() => _DownloadPdfState();
}

class _DownloadPdfState extends State<DownloadPdf> {
  late Future<List<TreeCulturas>> tree = Api.getGeral();
  late List<TreeCulturas> t;
  @override
  Widget build(BuildContext context) => Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: FutureBuilder<List<TreeCulturas>>(
                future: tree,
                builder: (context, AsyncSnapshot asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    t = asyncSnapshot.data;
                    return ButtonWidget(
                      
                      text: 'Gerar PDF',
                      onClicked: () async {
                        final pdfFile = await PdfApi.generateTable(t);
                        PdfApi.openFile(pdfFile);
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          )
        ],
      );
}
