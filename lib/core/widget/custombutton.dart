import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String btname;
  const CustomButton({
    super.key,
    required this.onpress,
    required this.btname,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onpress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colour.pDeepDarkBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            btname,
            style: TextStyle(fontSize: 16, color: Colour.pWhite),
          ),
        ),
      ),
    );
  }
}
