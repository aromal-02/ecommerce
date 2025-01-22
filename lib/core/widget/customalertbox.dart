import 'package:flutter/material.dart';

import '../../features/presentation/profile/widget/customtext.dart';
import '../constant/colors.dart';

Future<dynamic> alertBox({
  BuildContext? context,
  String? title,
  Widget? content,
  String? leftBtnName,
  String? rightBtnName,
  VoidCallback? leftBtnTap,
  VoidCallback? rightBtnTap,
}) {
  return showDialog(
    barrierColor: const Color.fromARGB(72, 0, 0, 0),
    context: context!,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colour.pBackgroundBlack,
      contentTextStyle: const TextStyle(
          color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 16),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: const Color.fromARGB(255, 187, 184, 184), width: 2),
          borderRadius: BorderRadius.circular(20)),
      title: customtext(title, 22.0, Colour.pWhite, FontWeight.w500),
      content: content,
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colour.pDeepLightBlue)),
                onPressed: leftBtnTap,
                child: customtext(
                    leftBtnName, 14.0, Colour.pWhite, FontWeight.w500),

                // Text(
                //   leftBtnName!,
                //   // style: AppTextThemes.h8
                // )
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colour.pWhite)),
                onPressed: rightBtnTap,
                child: Text(
                  rightBtnName!,
                  //style:AppTextThemes.h4
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
