import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridWidgetBox extends StatelessWidget {
  final String imagePath;
  final String text;

  const GridWidgetBox({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.05, // Existing height
      width: screenWidth * 0.2, // Existing width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Image as the background
          ClipRRect(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              height: 250,
              width: 200,

              // Keep the existing scaling
            ),
          ),

          // Gradient overlay on top of the image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(255, 188, 55, 222),
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Text stacked on top of the gradient and image
          Positioned(
            left: 10,
            bottom: 15,
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20, // Existing font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
