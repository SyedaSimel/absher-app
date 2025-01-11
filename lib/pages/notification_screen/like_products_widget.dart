import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeProducts extends StatelessWidget {
  final List<Map<String, String>> products;

  const LikeProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return Container(
          margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.04,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                product["imagePath"]!,
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                fit: BoxFit.cover,
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Text(
                          "PAPARIKA",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "closed",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SvgPicture.asset("assets/icons/heartpurple_icon.svg",
                  width: screenWidth * 0.09, height: screenWidth * 0.09)
            ],
          ),
        );
      },
    );
  }
}
