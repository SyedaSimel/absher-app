import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  CartItemWidget({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.initialQuantity,
    required this.onQuantityChanged,
  });

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Leading Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.imagePath,
              width: screenWidth * 0.2,
              height: screenHeight * 0.09,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12.0), // Space between image and text

          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),

          // Trailing Icons and Text
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Qty",
                style: TextStyle(fontSize: 12, color: Colors.grey[300]),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) {
                          quantity--;
                          widget.onQuantityChanged(quantity);
                        }
                      });
                    },
                    icon: SvgPicture.asset("assets/icons/lessarrow_icon.svg"),
                  ),
                  Text(
                    '$quantity', // Quantity value
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                        widget.onQuantityChanged(quantity);
                      });
                    },
                    icon: SvgPicture.asset("assets/icons/morearrow_icon.svg"),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
            ],
          ),
        ],
      ),
    );
  }
}
