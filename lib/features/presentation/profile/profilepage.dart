import 'package:flutter/material.dart';
import 'package:product_list/features/presentation/auth/login.dart';
import 'package:product_list/features/presentation/profile/widget/customtext.dart';
import 'package:product_list/features/presentation/profile/wishlist.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widget/customalertbox.dart';
import '../../../core/widget/customappbar.dart';
import '../../../core/widget/customsearchbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.pBackgroundBlack,
      appBar: CustomAppbar(
        title: "Profile",
        visible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              customtext("John", 20.0, Colour.pWhite, FontWeight.bold),
              customtext("9966969685", 20.0, Colour.pWhite, FontWeight.bold),
              ListTile(
                title: customtext(
                    "WishList", 18.0, Colour.pWhite, FontWeight.w500),
                leading: Icon(
                  Icons.favorite_border_rounded,
                  color: Colour.pWhite,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WishList()));
                },
              ),
              ListTile(
                title: customtext("LogOut", 18.0, Colour.pred, FontWeight.w500),
                onTap: () {
                  alertBox(
                      context: context,
                      title: "LogOut",
                      content: Text(
                        "Are You Sure To LogOut?",
                        textAlign: TextAlign.center,
                      ),
                      leftBtnName: "No",
                      rightBtnName: "Yes",
                      leftBtnTap: () {
                        Navigator.pop(context);
                      },
                      rightBtnTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()),
                          (Route<dynamic> route) => false,
                        );
                      });
                },
                leading: Icon(
                  Icons.logout,
                  color: Colour.pred,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
