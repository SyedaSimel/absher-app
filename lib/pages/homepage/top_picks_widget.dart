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

    return Column(
      mainAxisSize: MainAxisSize.min, 
      children: <Widget>[
        Container(
          child: Image.asset(
            imagePath,
            height:
                screenHeight * 0.15,
            width: screenWidth * 0.25,
            fit: BoxFit.contain,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        SizedBox(
            height: screenHeight * 0.0), 
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.purple,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center, 
        ),
      ],
    );
  }
}
