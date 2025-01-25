import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack for the image and logo
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
                  top: screenHeight * 0.11,
                  left: screenWidth * 0.07,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate to the previous page
                    },
                    child: SvgPicture.asset(
                      "assets/icons/back_icon.svg",
                    ),
                  ),
                )
              ],
            ),
            // Wrapping everything below the Stack in a scroll view
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Your Balance",
                              style: GoogleFonts.montserrat(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center, // Center alignment
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center horizontally
                              children: [
                                Baseline(
                                  baseline:
                                      60, // Adjust this value based on the text font size
                                  baselineType: TextBaseline.alphabetic,
                                  child: SvgPicture.asset(
                                    "assets/icons/coin-comp_icon.svg",
                                    height: 60, // Adjusted size of the icon
                                    width: 60,
                                  ),
                                ),
                                // Add spacing between the icon and text
                                Baseline(
                                  baseline:
                                      10, // Match this value with the font size of the text
                                  baselineType: TextBaseline.alphabetic,
                                  child: Text(
                                    "9999",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 37,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Cards Section
                      Column(
                        children: [
                          Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.white,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/send_fill_img.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Invite Your friends',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                'Get points by sharing with your friends',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              onTap: () {
                                print('Card tapped');
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomCard(
                            title: 'Gift Cards',
                            subtitle: 'Get points by Lorem Ipsum',
                            imagePath: 'assets/images/giftbox_img.png',
                            suffixText: '68',
                            onTap: () {
                              print('Gift Card Tapped');
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomCard(
                            title: 'Free Delivery',
                            subtitle: 'Redeem points and get it',
                            imagePath: 'assets/images/truck_img.png',
                            suffixText: '30',
                            onTap: () {
                              print('Free Delivery Tapped');
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomCard(
                            title: 'Free iTunes Theme',
                            subtitle: 'Redeem points and get it',
                            imagePath: 'assets/images/itunes_img.png',
                            suffixText: '150',
                            onTap: () {
                              print('Free iTunes Theme Tapped');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String suffixText;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.suffixText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Adds padding inside the card
        child: Row(
          children: [
            // Leading Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(width: 12),
            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Suffix Area: Icon, Text, and Button
            Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensure Column takes minimal vertical space
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/coin-comp_icon.svg",
                      height: 28, // Adjusted size of the icon
                      width: 28,
                    ),
                    const SizedBox(
                        width: 0), // Minimal spacing between icon and text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        suffixText,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20, // Adjusted horizontal padding
                      vertical: 4, // Minimal vertical padding
                    ),
                    minimumSize: Size.zero, // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // Shrink button height
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    'Redeem',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
