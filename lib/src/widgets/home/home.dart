import 'package:agrowebpragasdoencas/src/widgets/home/button-continue.dart';
import 'package:agrowebpragasdoencas/src/widgets/home/description-welcome.dart';
import 'package:agrowebpragasdoencas/src/widgets/home/img-back.dart';
import 'package:agrowebpragasdoencas/src/widgets/home/text-welcome.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/search-widget.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adicionar',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF01086D),
          title: Center(
            child: Text(
              "POSTAR",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF0E96CC),
        body: Container(
          width: double.infinity,
          child: Column(
            children: const <Widget>[
              TextWelcome(),
              Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration.collapsed(
                          hintText: "add"),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      
                      maxLines: 8,
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter your text here"),
                    ),
                  )),
              ButtonContinue(),
            ],
          ),
        ),
      ),
    );
  }
}
