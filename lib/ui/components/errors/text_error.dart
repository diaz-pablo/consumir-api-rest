import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  String text;

  TextError(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 26, color: Colors.white));
  }
}