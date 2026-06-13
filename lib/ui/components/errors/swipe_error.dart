  import 'package:flutter/material.dart';

class SwipeError extends StatelessWidget {
  String text;

  SwipeError(this.text);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(text, style: TextStyle(fontSize: 26, color: Colors.black)),
          Icon(Icons.refresh, color: Colors.blue),
          Text("Desliza para actualizar", style: TextStyle(fontSize: 26, color: Colors.black)),
        ],
      ),
    );
  }
}