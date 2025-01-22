import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/constant/colors.dart';
import 'package:product_list/features/data/api/carousil_api.dart';
import 'package:product_list/features/presentation/home/homepage.dart';
import 'package:product_list/features/presentation/products/productpage.dart';
import 'package:product_list/features/presentation/profile/profilepage.dart';
import '../../data/api/product_api.dart'; // Ensure this import path is correct
import '../products/bloc/product_bloc.dart';
import '../../../core/widget/bottomnavi.dart';
import 'bloc/home_bloc.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _activeIndex = 0;

  late final ProductBloc _productBloc;
  late final ProductController _productController;
  late final BannerController _bannerController;
  late final List<Widget> _pages;
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();

    _productController = ProductController();

    _bannerController = BannerController();

    _productBloc = ProductBloc(_productController);
    _homeBloc = HomeBloc(_productController,_bannerController);

    _pages = [
      HomePage(_homeBloc),
      ProductPage(_productBloc),
      ProfilePage(),
    ];
  }

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }

  void _onNavBarTap(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.pBackgroundBlack,
      body: _pages[_activeIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: BottomNavBar(
          activeIndex: _activeIndex,
          onTap: _onNavBarTap,
        ),
      ),
    );
  }
}
