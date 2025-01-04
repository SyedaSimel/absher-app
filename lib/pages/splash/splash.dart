import "package:flutter/material.dart";
import 'package:absher_flutter/pages/login_signup/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 178,
            height: 140,
          ),
        ),
      ),
    );
  }
}
