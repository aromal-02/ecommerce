import 'package:flutter/material.dart';
import 'package:product_list/features/presentation/auth/login.dart';
import 'package:product_list/features/presentation/home/bottom_navi.dart';
import 'package:product_list/features/presentation/splash/bloc/splasbloc.dart';
import '../../../core/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SplashScreenBloc();

    _bloc.navigate.listen((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
            LoginScreen()
            ),
      );
    });
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colour.pDeepLightBlue, Colour.pDeepDarkBlue],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.shopping_cart,
            size: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
