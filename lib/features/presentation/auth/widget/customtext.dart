import 'package:flutter/material.dart';

class CustomTexts extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontweight;

  const CustomTexts({super.key, required this.text, required this.color, required this.size, required this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontweight,
      ),
    );
  }
}
