import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';

class WebViewPragasMorango extends StatefulWidget {
  const WebViewPragasMorango({Key? key}) : super(key: key);
  @override
  _WebViewPragasMorangoState createState() => _WebViewPragasMorangoState();
}

class _WebViewPragasMorangoState extends State<WebViewPragasMorango> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return WebView(
        initialUrl:
            'https://sistemasdeproducao.cnptia.embrapa.br/FontesHTML/Morango/MesaSerraGaucha/pragas.htm',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        zoomEnabled: true,
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      );
    });
  }
}
