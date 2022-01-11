import 'package:flutter/material.dart';

class DataTableTextWidget extends StatefulWidget {
  const DataTableTextWidget({Key? key}) : super(key: key);

  @override
  _DataTableTextWidgetState createState() => _DataTableTextWidgetState();
}

class _DataTableTextWidgetState extends State<DataTableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Cultura: Morango",
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
            "assets/images/strawberryoval.png",
            fit: BoxFit.contain,
            height: 32,
          ),
        ],
      ),
    );
  }
}
