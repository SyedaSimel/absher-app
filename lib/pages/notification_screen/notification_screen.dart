import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSelected = false;

  // Example product data
  final List<Map<String, String>> products = [
    {
      "imagePath": "assets/images/like1_img.png",
      "title": "Cheese Burger",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like2_img.png",
      "title": "Sandwitch",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like3_img.png",
      "title": "Cake",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like4_img.png",
      "title": "Cupcake",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like5_img.png",
      "title": "MilkShake",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like6_img.png",
      "title": "Pizza",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          // Header Row
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/back_icon.svg',
                  ),
                ),
                const Spacer(),
                Text(
                  "All Favorite",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 21.0,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    print("Bell icon pressed");
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/bell_icon.svg',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),

          // Sliding Button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: 15,
            ),
            child: Material(
              elevation: 1, // Add light elevation
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: screenWidth * 0.8,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),

                  color: Colors.white, // Ensure background remains white
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: isSelected
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Material(
                        elevation: 1, // Elevation for the sliding background
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: screenWidth * 0.45,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 155, 28, 187),
                                Color.fromARGB(255, 188, 55, 222),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = false; // Select "Current Order"
                              });
                            },
                            child: Center(
                              child: Text(
                                "Vendors",
                                style: GoogleFonts.montserrat(
                                    color:
                                        isSelected ? Colors.grey : Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.04),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = true; // Select "Past Order"
                              });
                            },
                            child: Center(
                              child: Text(
                                "Products",
                                style: GoogleFonts.montserrat(
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.04),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Product List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    height:
                        screenWidth * 0.15, // Set a fixed height for the Row
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Product Image
                        Image.asset(
                          product["imagePath"]!,
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: screenWidth * 0.03),

                        // Product Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Center text
                            children: [
                              Text(
                                product["title"]!,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth * 0.045,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    product["subtitle"]!,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.green,
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  if (index == 0 ||
                                      index == 2 ||
                                      index ==
                                          products.length -
                                              1) // Condition for "closed" text
                                    SizedBox(width: screenWidth * 0.02),
                                  if (index == 0 ||
                                      index == 2 ||
                                      index == products.length - 1)
                                    Text(
                                      "closed",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.red,
                                        fontSize: screenWidth * 0.038,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),

                        // Heart Icon with Fixed Size
                        SizedBox(
                          width: 80, // Fixed width for the heart icon
                          height: 80, // Fixed height for the heart icon
                          child: SvgPicture.asset(
                            "assets/icons/heartpurple_icon.svg",
                            height: 25,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
