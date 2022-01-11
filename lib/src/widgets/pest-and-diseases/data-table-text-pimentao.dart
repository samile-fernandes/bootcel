import 'package:flutter/material.dart';

class DataTableTextPimentao extends StatefulWidget {
  const DataTableTextPimentao({Key? key}) : super(key: key);

  @override
  _DataTableTextPimentaoState createState() => _DataTableTextPimentaoState();
}

class _DataTableTextPimentaoState extends State<DataTableTextPimentao> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 780.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Cultura: Pimentão",
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
              "assets/images/pimentOval.png",
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ));
  }
}
