import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/data/api/carousil_api.dart';
import 'package:product_list/features/data/api/product_api.dart';
import 'package:product_list/features/presentation/home/bloc/home_bloc.dart';
import 'package:product_list/features/presentation/products/bloc/product_bloc.dart';

import 'features/presentation/splash/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            ProductController(),
            BannerController(),
          ),
        ),
         BlocProvider<ProductBloc>(
          create: (_) => ProductBloc(
            ProductController(),
           
          ),
        ), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
