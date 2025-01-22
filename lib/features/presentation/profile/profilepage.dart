import 'package:flutter/material.dart';
import 'package:product_list/features/presentation/auth/login.dart';
import 'package:product_list/features/presentation/profile/widget/customtext.dart';
import 'package:product_list/features/presentation/profile/wishlist.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widget/customalertbox.dart';
import '../../../core/widget/customappbar.dart';
import '../../data/api/profile_api.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John";
  String phoneNumber = "9966969685";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final response = await ProfileController().fetchUserData();
      setState(() {
        name = response['name'] ?? "name";
        phoneNumber = response['phone_number'] ?? "9966969685";
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        name = "John";
        phoneNumber = "9966969685";
      });
    }
  }

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
            spacing: 20,
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              customtext(name, 20.0, Colour.pWhite, FontWeight.bold),
              customtext(phoneNumber, 20.0, Colour.pWhite, FontWeight.bold),
              ListTile(
                title: customtext(
                    "WishList", 18.0, Colour.pWhite, FontWeight.w500),
                leading: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colour.pWhite,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WishlistScreen()));
                },
              ),
              ListTile(
                title: customtext("LogOut", 18.0, Colour.pred, FontWeight.w500),
                onTap: () {
                  alertBox(
                      context: context,
                      title: "LogOut",
                      content: const Text(
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
                              builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false,
                        );
                      });
                },
                leading: const Icon(
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
