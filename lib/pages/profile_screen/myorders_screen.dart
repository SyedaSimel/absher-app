import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyordersScreen extends StatefulWidget {
  const MyordersScreen({super.key});

  @override
  State<MyordersScreen> createState() => _MyordersScreenState();
}

class _MyordersScreenState extends State<MyordersScreen> {
  bool isSelected = false; // False -> "Current Order", True -> "Past Order"

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/back_icon.svg',
                    ),
                  ),
                  // SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Material(
                      elevation: 1, // Add light elevation
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        height: 38, // Reduced height
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02, vertical: 5),
                              child: SvgPicture.asset(
                                'assets/icons/searchpurple_icon.svg',
                                width: screenWidth *
                                    0.025, // Slightly increased size
                                height: 24,
                              ),
                            ),
                            hintText: "Search",
                            hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.purple,
                              fontSize: 16.5,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            filled: true,
                            fillColor: Colors.white, // Set background color
                          ),
                        ),
                      ),
                    ),
                  ),

                  // SizedBox(width: screenWidth * 0.02),
                  IconButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/bell_icon.svg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
              ),
              child: Material(
                elevation: 1, // Add light elevation
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: screenWidth * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
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
                                  "Current Order",
                                  style: GoogleFonts.montserrat(
                                      color: isSelected
                                          ? Colors.grey
                                          : Colors.white,
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
                                  "Past Order",
                                  style: GoogleFonts.montserrat(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey,
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
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: isSelected
                  ? _buildPastOrders() // Render Past Orders
                  : _buildCurrentOrders(), // Render Current Orders
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentOrders() {
    return Column(
      children: List.generate(1, (index) {
        return _buildOrderCardCurrent(
            "Preparing", "Restaurant Name", "QAR 635", "Order #23645955");
      }),
    );
  }

  Widget _buildPastOrders() {
    return Column(
      children: List.generate(3, (index) {
        return _buildOrderCard("Delivered at 10:38pm, 20.02.2022",
            "Restaurant Name", "QAR 635", "Order #23645955");
      }),
    );
  }

  Widget _buildOrderCardCurrent(
      String date, String restaurant, String price, String orderId) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/greenbgright_icon.svg",
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/images/orderfood_img.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            price,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderId,
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/greyforwardarrow_icon.svg",
                        width: 15,
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.purple,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  side: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              child: Text(
                "Track Order",
                style: GoogleFonts.montserrat(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(
      String date, String restaurant, String price, String orderId) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/greenbgright_icon.svg",
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/images/orderfood_img.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            price,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderId,
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/greyforwardarrow_icon.svg",
                        width: 15,
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                        ),
                        side: BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    child: Text(
                      "Re-Order",
                      style: GoogleFonts.montserrat(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                        ),
                        side: BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    child: Text(
                      "Rate Now!",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
