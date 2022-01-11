import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDoencasTomate extends StatefulWidget {
  const WebViewDoencasTomate({Key? key}) : super(key: key);
  @override
  _WebViewDoencasTomateState createState() => _WebViewDoencasTomateState();
}

class _WebViewDoencasTomateState extends State<WebViewDoencasTomate> {
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
            'https://www.embrapa.br/hortalicas/tomate-de-mesa/doencas-causadas-por-virus',
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
