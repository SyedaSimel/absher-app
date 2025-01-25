import 'package:absher_flutter/pages/cart_screen/comp_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Stack(
                  alignment: Alignment
                      .center, // This ensures both horizontal and vertical centering
                  children: [
                    Align(
                      alignment: Alignment
                          .centerLeft, // Back button aligned to the left
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/back_icon.svg',
                        ),
                      ),
                    ),
                    Text(
                      "Check out",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Item Section
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/mc_img.png",
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem ipsum dolor sit amet",
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(188, 55, 222, 0.85),
                                    Color.fromRGBO(155, 28, 187, 0.85),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 5),
                                  SvgPicture.asset(
                                    "assets/icons/star_icon.svg",
                                    height: 19,
                                    width: 19,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "3.6",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/clock_icon.svg",
                                  height: 19,
                                  width: 19,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Delivery: 40 mins",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 188, 55, 222),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Delivery Address Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/delivery_loc_pin_icon.svg",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Delivery Address",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: Color.fromARGB(255, 188, 55, 222),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      "assets/images/adress_text.png",
                      width: 180,
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/maps_img.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 100,
                          child: SvgPicture.asset("assets/icons/Pin_fill.svg"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 0.5, // Set the elevation to 0.5
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded borders
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cart Total",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$16',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' USD',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Charge",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$3',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' USD',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$19',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' USD',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Deliver Now",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(49),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Add spacing between buttons
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Deliver Later",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.purple,
                              side: BorderSide(color: Colors.purple),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(49),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Background color set to white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Promo Code",
                            style: GoogleFonts.montserrat(
                              color: Color.fromARGB(255, 188, 55, 222),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            "assets/icons/promo_icon.svg",
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/wallet_icon.svg"),
                              const SizedBox(width: 5),
                              Text(
                                "Cash On Delivery",
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(255, 188, 55, 222),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            "\$ 13 USD",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity, // Makes the button take full width
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CompOrderScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(49),
                      ),
                      child: Center(
                        child: Text(
                          'Place Order',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
