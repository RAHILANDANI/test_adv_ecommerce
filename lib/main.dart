import 'package:adv_test_app/provider/api_provider.dart';
import 'package:adv_test_app/viwes/cartpage.dart';
import 'package:adv_test_app/viwes/detailpage.dart';
import 'package:adv_test_app/viwes/home_page.dart';
import 'package:adv_test_app/viwes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'homepage': (context) => HomePage(),
          'detail': (context) => DetailPage(),
          'cart': (context) => CartPage(),
        },
      ),
    ),
  );
}
