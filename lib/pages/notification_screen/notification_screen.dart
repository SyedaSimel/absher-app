import 'package:absher_flutter/pages/notification_screen/like_products_widget.dart';
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
      "title": "Veg Pizza",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like3_img.png",
      "title": "Tacos",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like4_img.png",
      "title": "Chocolate Cake",
      "subtitle": "PAPRIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like5_img.png",
      "title": "Ice Cream",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
    {
      "imagePath": "assets/images/like6_img.png",
      "title": "French Fries",
      "subtitle": "PAPARIKA",
      "iconPath": "assets/icons/heartpurple_icon.svg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(children: [
        // Header Row
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.04,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  print("Back button pressed");
                },
                icon: SvgPicture.asset(
                  'assets/icons/back_icon.svg',
                ),
              ),
              const Spacer(),
              Text(
                "All Favorite",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  print("Bell icon pressed");
                },
                icon: SvgPicture.asset(
                  'assets/icons/bell_icon.svg',
                ),
              ),
            ],
          ),
        ),

        // Sliding Button
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Container(
            width: screenWidth * 0.8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                // Sliding Indicator
                AnimatedAlign(
                  duration: Duration(milliseconds: 100),
                  alignment:
                      isSelected ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: screenWidth * 0.4,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                // Options
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = false; // Select Option 1
                          });
                        },
                        child: Center(
                          child: Text(
                            "Vendors",
                            style: TextStyle(
                              color: isSelected ? Colors.grey : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = true; // Select Option 2
                          });
                        },
                        child: Center(
                          child: Text(
                            "Products",
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

        // Product List
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: LikeProducts(
                products: products, // Passing the product list to LikeProducts
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
