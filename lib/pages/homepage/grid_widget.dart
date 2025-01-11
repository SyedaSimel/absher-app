import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridWidgetBox extends StatelessWidget {
  final String imagePath;
  final String text;

  const GridWidgetBox({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 1.5,
      width: screenWidth * 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Image as the background
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Semi-transparent gradient overlay (purple shade with transparency)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(255, 188, 55, 222),
                  // Color.fromARGB(255, 120, 22, 145), // Fully transparent
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Text at the bottom-left in white
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
