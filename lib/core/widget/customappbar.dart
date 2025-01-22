import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool visible;

  const CustomAppbar({super.key, required this.title, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colour.pWhite),
      ),
      backgroundColor: Colour.pDeepLightBlue,
      leading: Visibility(
        visible: visible,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colour.pWhite,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
