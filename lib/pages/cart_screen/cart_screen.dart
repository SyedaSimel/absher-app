import 'package:absher_flutter/pages/cart_screen/cart_widget.dart';
import 'package:absher_flutter/pages/cart_screen/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = [0, 0, 0, 0];

  final List<Map<String, String>> items = [
    {
      "title": "&2.99",
      "subtitle": "Lorem ipsum dolor sit amet et dolore",
      "image": "assets/images/cart1_img.png"
    },
    {
      "title": "&2.99",
      "subtitle": "Lorem ipsum dolor sit amet et dolore",
      "image": "assets/images/cart2_img.png"
    },
    {
      "title": "&2.99",
      "subtitle": "Lorem ipsum dolor sit amet et dolore",
      "image": "assets/images/cart3_img.png"
    },
    {
      "title": "&2.99",
      "subtitle": "Lorem ipsum dolor sit amet et dolore",
      "image": "assets/images/cart4_img.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Stack (Image and Logo)
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: 130,
                  child: Image.asset(
                    'assets/images/whitebg_img.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.04,
                  left: screenWidth * 0.39,
                  child: SvgPicture.asset(
                    "assets/icons/purplelogo_icon.svg",
                    width: 74,
                    height: 72,
                  ),
                ),
              ],
            ),

            // Remaining Content
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Restaurant Name",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/trash_icon.svg"),
                      SizedBox(width: 8.0),
                      Text(
                        "Remove all",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.4, // Dynamically adjust the height
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(), // Prevent inner scroll
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    imagePath: items[index]['image']!,
                    title: items[index]['title']!,
                    subtitle: items[index]['subtitle']!,
                    initialQuantity: quantities[index],
                    onQuantityChanged: (newQuantity) {
                      setState(() {
                        quantities[index] = newQuantity;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Text("₪ 53 ",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SvgPicture.asset("assets/icons/delman_icon.svg"),
                          Text("Delivery Charge",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17)),
                        ]),
                        Text("₪ 1.5 ",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Discount%",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17)),
                        Text("₪ 3 ",
                            style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 125, 209, 193),
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                        Text("₪ 51.5 ",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Add more",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 45.0), // Keep the original padding
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Keep some spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckoutScreen()),
                        );
                      },
                      child: Text(
                        "Check out",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 45.0), // Keep the original padding
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
