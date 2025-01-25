import 'package:absher_flutter/pages/homepage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Reusable HorizontalCardWidget for horizontal list items
class HorizontalCardWidget extends StatelessWidget {
  final String imagePath; // Path to the image
  final double width; // Card width
  final double height; // Card height

  const HorizontalCardWidget({
    Key? key,
    required this.imagePath,
    this.width = 160.0, // Default width
    this.height = 200.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 8.0), // Spacing between cards
      width: width,
      height: height,
      child: Card(
        elevation: 0.0, // No shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        clipBehavior: Clip.antiAlias, // Ensure the image is clipped to the card
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Image fully covers the card
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  final List<Map<String, String>> tileData = [
    {
      'title': 'Cone Cafe',
      'subtitle': '4.4M Saved',
      'image': 'assets/images/bonton_img.png',
    },
    {
      'title': 'BonTon',
      'subtitle': '4.4M Saved',
      'image': 'assets/images/bonton2_img.png',
    },
    {
      'title': 'Surf Coffee',
      'subtitle': '4.4M Saved',
      'image': 'assets/images/bonton3_img.png',
    },
    {
      'title': 'Cone Cafe',
      'subtitle': '4.4M Saved',
      'image': 'assets/images/bonton_img.png',
    },
  ];

  final List<String> horizontalImages = [
    "assets/images/card2_img.png",
    "assets/images/card2_img.png",
    "assets/images/card3_img.png",
    "assets/images/card2_img.png",
    "assets/images/card1_img.png",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                // bottom: screenHeight * 0.1,
                top: screenHeight * 0.01,
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
                                  horizontal: screenWidth * 0.019, vertical: 6),
                              child: SvgPicture.asset(
                                'assets/icons/searchpurple_icon.svg',
                                width: screenWidth *
                                    0.02, // Slightly increased size
                                height: 5,
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
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: tileData.asMap().entries.map((entry) {
                final index = entry.key;
                final data = entry.value;

                return ListTile(
                  leading: index == tileData.length - 1
                      ? Container(
                          width: 60, // Size of the circle
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white, // White background
                            shape: BoxShape.circle, // Circular shape
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "#",
                              style: TextStyle(
                                color: Color.fromARGB(
                                    255, 92, 92, 92), // Grey text color
                                fontWeight: FontWeight.bold,
                                fontSize: 30, // Font size
                              ),
                            ),
                          ),
                        )
                      : Image.asset(
                          data['image']!,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                  title: index == tileData.length - 1
                      ? Text(
                          "#treandy", // Custom title for the last tile
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, // Bold text
                            color: Colors.black, // Purple color
                            fontSize: 16, // Font size
                          ),
                        )
                      : Text(
                          data['title']!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                  subtitle: Text(
                    data['subtitle']!,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Text(
                "Top Searched",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 92, 92, 92),
                  fontSize: screenWidth * 0.05,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.0),
              height: screenHeight * 0.25, // Adjusted height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: horizontalImages.length,
                itemBuilder: (context, index) {
                  return HorizontalCardWidget(
                    imagePath: horizontalImages[index],

                    width: screenWidth * 0.4, // Responsive width
                    height: screenHeight * 0.2, // Responsive height
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
