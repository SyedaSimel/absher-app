import 'package:absher_flutter/pages/homepage/home_screen.dart';
import 'package:absher_flutter/pages/login_signup/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

String? selectedValue = "yes";

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: screenHeight * 0.12,
                width: screenWidth * 0.3,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text("Sign in to continue",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.025,
                      color: const Color.fromARGB(255, 39, 57, 100))),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(49.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(1, 126, 126, 126), width: 1)),
                    hintText: "Phone",
                    hintStyle: TextStyle(
                      fontSize: screenWidth * 0.035,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/phone_icon.svg',
                        width: screenWidth * 0.02,
                        height: screenWidth * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(49.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(1, 126, 126, 126), width: 1)),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: screenWidth * 0.035,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/lock_icon.svg',
                        width: screenWidth * 0.02,
                        height: screenWidth * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              // RadioListTile<String>(
              //   title: Text(
              //     'Remember me',
              //     style: GoogleFonts.montserrat(
              //         fontSize: screenWidth * 0.030,
              //         fontWeight: FontWeight.w400),
              //   ),
              //   value: "",
              //   groupValue: selectedValue,
              //   onChanged: (value) {},
              // ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.88,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 155, 28, 187),
                        Color.fromARGB(255, 120, 22, 145),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(49),
                  ),
                  child: Center(
                    child: Text(
                      'Log in',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.03,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.03,
                      color: Colors.purple),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Log in with',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.025,
                    color: const Color.fromARGB(255, 126, 126, 126)),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.88,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 103, 178),
                    borderRadius: BorderRadius.circular(49),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/facebook_icon.svg',
                        width: screenWidth * 0.04,
                        height: screenWidth * 0.04,
                      ),
                      SizedBox(
                        width: screenWidth * 0.03,
                      ),
                      Text(
                        'Continue with facebook',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.03,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.88,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 68, 55),
                    borderRadius: BorderRadius.circular(49),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/gmail_icon.svg',
                        width: screenWidth * 0.04,
                        height: screenWidth * 0.04,
                      ),
                      SizedBox(
                        width: screenWidth * 0.03,
                      ),
                      Text(
                        'Continue with Gmail',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.03,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.045,
              ),
              Text.rich(TextSpan(
                  text: "Don't have an account yet?",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: screenWidth * 0.03,
                  ),
                  children: [
                    TextSpan(
                        text: " Sign up",
                        style: GoogleFonts.montserrat(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Colors.purple,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()),
                            );
                          })
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
