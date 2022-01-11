// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonCeasa extends StatefulWidget {
  const ButtonCeasa({Key? key}) : super(key: key);
  @override
  _ButtonCeasaState createState() => _ButtonCeasaState();
}

class _ButtonCeasaState extends State<ButtonCeasa> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox(
        width: double.infinity,
        height: 70,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0x00ffffff), Color(0xffFFFFFF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(120.0)),
            child: Container(
                constraints:
                    const BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: const Text(
                  'CONFIRA - CEASA',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 12,
                    color: Color(0xff6c63ff),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                )),
          ),
          onPressed: () => {
            _launchURL('https://www.ceasa-ce.com.br/boletim-diario-de-precos/')
          },
        ),
      ),
    ]);
  }
}
