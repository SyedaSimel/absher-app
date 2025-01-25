import 'package:absher_flutter/pages/cart_screen/cart_screen.dart';
import 'package:absher_flutter/pages/cart_screen/checkout_screen.dart';
import 'package:absher_flutter/pages/homepage/home_screen.dart';
import 'package:absher_flutter/pages/profile_screen/balance_screen.dart';
import 'package:absher_flutter/pages/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}
