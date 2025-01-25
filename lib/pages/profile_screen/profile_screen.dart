import 'package:absher_flutter/pages/profile_screen/balance_screen.dart';
import 'package:absher_flutter/pages/profile_screen/myorders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      "About us",
      "Language",
      "Coupon",
      "Help & Support",
      "Privacy Policy",
      "Terms & Conditions",
      "Log Out",
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                // Background Image
                Container(
                  width: screenWidth,
                  height: 120, // Keep height fixed
                  child: Image.asset(
                    'assets/images/purplebg_img.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                // Logo
                Positioned(
                  top: 27, // Fixed top position
                  left: screenWidth *
                      0.39, // Center horizontally based on screen width
                  child: SvgPicture.asset(
                    "assets/icons/whitelogo_icon.svg",
                    width: 72, // Fixed width
                    height: 70, // Fixed height
                  ),
                ),
                // Points Text
                Positioned(
                  top: 108, // Fixed top position
                  right: screenWidth *
                      0.115, // Right alignment based on screen width
                  child: Text(
                    "Points",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                      fontSize: 13.5, // Keep font size fixed
                    ),
                  ),
                ),
              ],
            ),

            // Scrollable content starts here
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BalanceScreen()),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 23,
                                width: screenWidth * 0.16,
                                margin:
                                    const EdgeInsets.only(right: 17, top: 5),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 155, 28, 187),
                                      Color.fromARGB(255, 120, 22, 145),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(49),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9),
                                  child: Text(
                                    "9999",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1,
                                right: screenWidth * 0.0,
                                child: Container(
                                  height: 30,
                                  width: screenWidth * 0.075,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 155, 28, 187),
                                        Color.fromARGB(255, 120, 22, 145),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/icons/coin_icon.svg",
                                      width: screenWidth * 0.01,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Container(
                            width: screenWidth * 0.28,
                            height: 130,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              "assets/images/profile_img.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Alferado Aminof",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.12),
                                SvgPicture.asset(
                                  "assets/icons/edit_icon.svg",
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "SYDNEY, AUS 🇦🇺",
                              style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 113, 113, 113),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "EMAIL: tonymestrov@grnsw.com",
                              style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 113, 113, 113),
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "PHONE: 0404 433 361",
                              style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 113, 113, 113),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Address",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 113, 113, 113),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DottedBorder(
                                color: Colors.grey.withOpacity(0.5),
                                strokeWidth: 1,
                                dashPattern: [4, 3],
                                child: Container(
                                  width: screenWidth * 0.6,
                                  height: screenHeight * 0.05,
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "123 George St, \nHaymarket, NSW",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Update Address",
                                style: GoogleFonts.montserrat(
                                  color: Colors.purple,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Favourites",
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.purple,
                              side: BorderSide(color: Colors.purple),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: screenWidth * 0.13),
                              elevation: 0,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyordersScreen()),
                              );
                            },
                            child: Text(
                              "My Orders",
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.purple,
                              side: BorderSide(color: Colors.purple),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: screenWidth * 0.13),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17.0),
                                      child: Text(
                                        items[index],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 113, 113, 113)),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/boldforwardarrow_icon.svg",
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
