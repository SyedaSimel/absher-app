import 'package:absher_flutter/pages/login_signup/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

String? selectedValue = "yes";

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              Text(
                "Sign up",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                  color: const Color.fromARGB(255, 39, 57, 100),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(1, 126, 126, 126),
                        width: 1,
                      ),
                    ),
                    hintText: "Full Name",
                    hintStyle: TextStyle(fontSize: screenWidth * 0.040),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/user_icon.svg',
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(1, 126, 126, 126),
                        width: 1,
                      ),
                    ),
                    hintText: "Email Address",
                    hintStyle: TextStyle(fontSize: screenWidth * 0.040),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/@_icon.svg',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(1, 126, 126, 126),
                        width: 1,
                      ),
                    ),
                    hintText: "Phone",
                    hintStyle: TextStyle(fontSize: screenWidth * 0.040),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/phone_icon.svg',
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(1, 126, 126, 126),
                        width: 1,
                      ),
                    ),
                    hintText: "Address",
                    hintStyle: TextStyle(fontSize: screenWidth * 0.040),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/pin_icon.svg',
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(1, 126, 126, 126),
                        width: 1,
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: screenWidth * 0.040),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/lock_icon.svg',
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(1, 126, 126, 126),
                        width: 1,
                      ),
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(fontSize: screenWidth * 0.040),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/lock_icon.svg',
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // RadioListTile<String>(
              //   title: Text(
              //     "By Signing up, you agree to terms and conditions.",
              //     style: GoogleFonts.montserrat(
              //       fontSize: screenWidth * 0.028,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              //   value: "agree",
              //   groupValue: selectedValue,
              //   onChanged: (String? value) {
              //     selectedValue = value;
              //   },
              // ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: screenWidth * 0.9,
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
                      'Sign up',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.045,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text.rich(
                TextSpan(
                  text: "Already have an account?",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: screenWidth * 0.040,
                  ),
                  children: [
                    TextSpan(
                      text: " Login",
                      style: GoogleFonts.montserrat(
                        fontSize: screenWidth * 0.040,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
