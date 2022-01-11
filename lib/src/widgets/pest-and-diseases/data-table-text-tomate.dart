import 'package:flutter/material.dart';

class DataTableTextTomate extends StatefulWidget {
  const DataTableTextTomate({Key? key}) : super(key: key);

  @override
  _DataTableTextTomateState createState() => _DataTableTextTomateState();
}

class _DataTableTextTomateState extends State<DataTableTextTomate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 225.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Cultura: Tomate",
              style: TextStyle(
                fontFamily: 'Europa',
                fontSize: 16,
                color: Color(0xffffffff),
                height: 2.0833333333333335,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "assets/images/tomatoOval.png",
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ));
  }
}
