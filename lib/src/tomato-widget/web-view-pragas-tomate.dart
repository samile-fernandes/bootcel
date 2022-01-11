import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPragasTomate extends StatefulWidget {
  const WebViewPragasTomate({Key? key}) : super(key: key);
  @override
  _WebViewPragasTomateState createState() => _WebViewPragasTomateState();
}

class _WebViewPragasTomateState extends State<WebViewPragasTomate> {
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
        initialUrl: 'https://www.embrapa.br/hortalicas/tomate-de-mesa/pragas1',
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
