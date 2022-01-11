import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
class WebViewPragasPimentao extends StatefulWidget {
  const WebViewPragasPimentao({Key? key}) : super(key: key);
  @override
  _WebViewPragasPimentaoState createState() => _WebViewPragasPimentaoState();
}

class _WebViewPragasPimentaoState extends State<WebViewPragasPimentao> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final urlPragas =
      'https://ainfo.cnptia.embrapa.br/digital/bitstream/item/215121/1/DOC-176.pdf';
  String? pdfFile;

  Future<String> downloadPdf() async {
    final diretorio = await getApplicationDocumentsDirectory();
    final arquivo = File('${diretorio.path}/DOC-176.pdf');
    if (await arquivo.exists()) {
      return arquivo.path;
    }
    final resposta = await http.get(Uri.parse(urlPragas));
    await arquivo.writeAsBytes(resposta.bodyBytes);
    return arquivo.path;
  }

  void carregarPdf() async {
    pdfFile = await downloadPdf();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    carregarPdf();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
              if(pdfFile!= null)
                Expanded(
                  child: PdfView(path: pdfFile!,),
                )
              else
              const CircularProgressIndicator(),
            ],
    );
  }
}
