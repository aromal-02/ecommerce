import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/data/api/carousil_api.dart';
import 'package:product_list/features/data/api/product_api.dart';
import 'package:product_list/features/presentation/home/bloc/home_bloc.dart';
import 'package:product_list/features/presentation/products/bloc/product_bloc.dart';

import 'features/presentation/splash/splashpage.dart';

void main() {
  Bloc.observer = SimpleBlocObserver(); 
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
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Error: $error');
  }
}
