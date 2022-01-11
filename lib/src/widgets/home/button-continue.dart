// ignore_for_file: deprecated_member_use

import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/pest-and-diseases.dart';
import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: double.infinity,
            height: 70,
            child: RaisedButton(
              color: Color(0xFFE0D63D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(120.0)),
                child: Container(
                    constraints:
                        const BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'ENIVAR OFERTA',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const PestDiseases();
                })),
              },
            ),
          ),
        ),
      ],
    );
  }
}
