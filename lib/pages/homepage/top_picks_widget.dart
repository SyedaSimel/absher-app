import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPicksWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const TopPicksWidget({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isHorizontal =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Material(
          elevation: 0.5,
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset(
              imagePath,
              height: isHorizontal
                  ? screenHeight * 0.1
                  : screenHeight * 0.05, // Adjust height for horizontal
              width: isHorizontal
                  ? screenWidth * 0.15
                  : screenWidth * 0.10, // Adjust width for horizontal
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
            height: isHorizontal
                ? screenHeight * 0.022
                : screenHeight * 0.01), // Adjust spacing
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16, // Keep font size consistent
            color: Colors.purple,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
