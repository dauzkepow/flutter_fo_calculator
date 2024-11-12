import 'package:flutter/material.dart';

Color getColorFromNumber(int number) {
  if (number < 10) {
    return Colors.red; // Number is less than 10, use red
  } else if (number < 20) {
    return Colors.blue; // Number is less than 20, use blue
  } else {
    return Colors.green; // Number is 20 or more, use green
  }
}

void main() {
  int number = 15;
  Color color = getColorFromNumber(number);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Color Mapping Example')),
      body: Center(
        child: Container(
          color: color,
          child: Text(
            'The number $number has color: ${color.toString()}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  ));
}
