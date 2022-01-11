import 'package:agrowebpragasdoencas/src/splashScreen/splash-screen.dart';
import 'package:agrowebpragasdoencas/src/widgets/my-app/my-app.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/pest-and-diseases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    /* runApp(MaterialApp(
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/MyApp': (BuildContext context) => const MyApp(),
        '/PestDiseases': (BuildContext context) => const PestDiseases(),
      },
    ));*/
    runApp(MyApp());
  });
}
