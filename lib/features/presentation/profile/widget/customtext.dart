import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

Widget customtext(text, size, color, weight) {
  return Text(text,
     style: TextStyle(
                  fontSize: size,
                  color: color,
                  fontWeight: weight,
                ),
  );
}