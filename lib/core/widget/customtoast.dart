import 'package:flutter/material.dart';
import 'package:product_list/core/constant/colors.dart';

class CustomToast {
  final String message;

  CustomToast({required this.message});

  void show(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colour.pDeepLightBlue,
      content: Text(
        message,
        style: TextStyle(color: Colour.pWhite),
      ),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
