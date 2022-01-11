import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-future-widget.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table-future-build-morango.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table-future-build-pimentao.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table-future-build-tomate.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table-text-pimentao.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table-text-tomate.dart';
import 'package:agrowebpragasdoencas/src/widgets/pest-and-diseases/data-table.text-widget.dart';
import 'package:flutter/material.dart';

class DataTableBuild extends StatefulWidget {
  const DataTableBuild({Key? key}) : super(key: key);
  @override
  _DataTableBuildState createState() => _DataTableBuildState();
}

class _DataTableBuildState extends State<DataTableBuild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        DataFutureBuildWidget(),
        DataTableTextWidget(),
        DataTableFutureBuildMorango(),
        DataTableTextTomate(),
        DataTableFutureBuildTomate(),
        DataTableTextPimentao(),
        DataTableFutureBuildPimentao(),
      ],
    );
  }
}
