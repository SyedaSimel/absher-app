import 'package:absher_flutter/pages/cart_screen/track_screen.dart';
import 'package:absher_flutter/pages/homepage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompOrderScreen extends StatelessWidget {
  const CompOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isHorizontal =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Upper Half Background Image
            Positioned(
              top: 0,
              left: 90,
              right: 0,
              child: Image.asset(
                'assets/images/Group.png',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),

            // Lower Half Background Image
            Positioned(
              bottom: 2,
              left: 0,
              right: 100,
              child: Image.asset(
                'assets/images/bgA_2img.png',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),

            // Center Scrollable Card (only in horizontal orientation)
            if (isHorizontal)
              SingleChildScrollView(
                child: Center(
                  child: _buildCard(context),
                ),
              )
            else
              // Regular Center Card in vertical orientation
              Center(
                child: _buildCard(context),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      width: 350,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Purple Gradient Container
          Positioned(
            top: 15,
            left: 15,
            right: 15,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 188, 55, 222),
                    Color.fromARGB(255, 120, 22, 145),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Content Inside Purple Container
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Thank You Text
                        Text(
                          "Thank you for using us\nLorem ipsum dolor sit amet",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Order Number
                        Text(
                          "Order# 25345251",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // McDonald's Logo
                  Positioned(
                    bottom: -30,
                    left: 120,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.1), // Very light shadow
                            blurRadius: 10, // Blurring effect
                            spreadRadius: 2, // Spread radius
                            offset: Offset(0, 5), // Vertical shadow offset
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        child: Image.asset(
                          "assets/images/mc_img.png",
                          height: 63,
                          width: 63,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Cyan Icon
          Positioned(
            top: -40,
            left: 130,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: SvgPicture.asset(
                "assets/icons/rightcyan_icon.svg",
                height: 75,
                width: 75,
              ),
            ),
          ),

          // Total Cost Section
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Cost",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "QAR 26",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Order Processing Section
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 28, 187, 0.09),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/info_icon.svg",
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Please wait your order is processing",
                          style: GoogleFonts.montserrat(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Track and Home Buttons
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TrackScreen()),
                        );
                      },
                    child: Text(
                      "Track",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 54.0),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      "Home",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple,
                      side: BorderSide(color: Colors.purple),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 54.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
