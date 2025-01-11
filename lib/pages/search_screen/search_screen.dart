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
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
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
    "assets/images/card1_img.png",
    "assets/images/card2_img.png",
    "assets/images/card3_img.png",
    "assets/images/card2_img.png",
    "assets/images/card1_img.png",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/back_icon.svg',
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/icons/searchpurple_icon.svg',
                          width: screenWidth * 0.03,
                          height: screenHeight * 0.03,
                        ),
                      ),
                      hintText: "Search",
                      hintStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.purple,
                        fontSize: screenWidth * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
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
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: tileData.map((data) {
              return ListTile(
                leading: Image.asset(
                  data['image']!,
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  data['title']!,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
                subtitle: Text(
                  data['subtitle']!,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: screenWidth * 0.035,
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
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: screenWidth * 0.05,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
    );
  }
}
