import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewDoencasMorango extends StatefulWidget {
  const WebViewDoencasMorango({Key? key}) : super(key: key);
  @override
  _WebViewDoencasMorangoState createState() => _WebViewDoencasMorangoState();
}

class _WebViewDoencasMorangoState extends State<WebViewDoencasMorango> {
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
            'https://sistemasdeproducao.cnptia.embrapa.br/FontesHTML/Morango/MesaSerraGaucha/virus.htm',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      );
    });
  }
}
