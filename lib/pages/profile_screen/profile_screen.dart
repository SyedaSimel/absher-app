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
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: 120,
                      child: Image.asset(
                        'assets/images/purplebg_img.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.03,
                      left: screenWidth * 0.39,
                      child: SvgPicture.asset(
                        "assets/icons/whitelogo_icon.svg",
                        width: 74,
                        height: 72,
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.137,
                      left: screenWidth * 0.83,
                      child: Text(
                        "Points",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.purple,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: screenHeight * 0.027,
                        width: screenWidth * 0.16,
                        margin: EdgeInsets.only(right: 17, top: 5),
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
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "999",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -16,
                        right: 10,
                        child: Container(
                          height: screenHeight * 0.075,
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
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/coin_icon.svg",
                              width: 23,
                              height: 23,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 20),
                      child: Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.14,
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
                          children: [
                            Text(
                              "Alferado Aminof",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(width: 8),
                            SvgPicture.asset("assets/icon/edit_icon.svg")
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 113, 113, 113),
                                  fontSize: 16,
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
                              height: screenHeight * 0.04,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "123 George St, \nHaymarket, NSW",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12, color: Colors.black),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                              vertical: 12.0, horizontal: 52.0),
                          elevation: 0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "My Orders",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.purple,
                          side: BorderSide(color: Colors.purple),
                          padding: EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 52.0),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17.0),
                                  child: Text(
                                    items[index],
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 113, 113, 113)),
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
      ),
    );
  }
}
