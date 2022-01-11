import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: RaisedButton.icon(
          color: Colors.black,
          onPressed: onClicked,
          label: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          icon: Icon(
            Icons.picture_as_pdf,
            color: Colors.white,
          ),
        ),
      );

  /*ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: onClicked,
      );*/
}
