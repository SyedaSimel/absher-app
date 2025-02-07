import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final List<String> cartImages = [
    "assets/images/cart1_img.png",
    "assets/images/cart3_img.png",
    "assets/images/cart4_img.png",
  ];

  int _currentStep = 0;

  // List of step labels
  final List<String> _steps = [
    "Received",
    "Processed",
    "Picked Up",
    "Delivered"
  ];

  // List of icons for each step
  final List<String> _icons = [
    "assets/icons/recieved_icon.svg",
    "assets/icons/refresh_icon.svg",
    "assets/icons/packed_icon.svg",
    "assets/icons/deliver_icon.svg"
  ];

  void _moveToNextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(
                  context); // This pops the current screen off the navigation stack
            },
            child: SvgPicture.asset("assets/icons/back_icon.svg"),
          ),
        ),
        title: Text(
          "Received",
          style: GoogleFonts.montserrat(
            color: Colors.purple,
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.047,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.35,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight *
                              0.05), // Adjust top padding based on screen height
                      child: Image.asset(
                        "assets/images/track_img.png",
                        fit: BoxFit.contain,
                        width: screenWidth *
                            0.5, // Adjust image width proportionally to screen width
                        height: screenHeight *
                            0.18, // Adjust image height proportionally to screen height
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        // Wrap the Padding and Container with Expanded to prevent overflow
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth *
                                  0.05), // Adjust horizontal padding based on screen width
                          child: Container(
                            height: screenHeight *
                                0.08, // Adjust container height proportionally to screen height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.purple,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth *
                                    0.05, // Adjust horizontal padding based on screen width
                                vertical: 0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "44",
                                    style: GoogleFonts.montserrat(
                                      fontSize: screenWidth *
                                          0.08, // Adjust font size based on screen width
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                      height: screenHeight *
                                          0.01), // Adjust vertical space proportionally
                                  Text(
                                    "Mints",
                                    style: GoogleFonts.montserrat(
                                      fontSize: screenWidth *
                                          0.04, // Adjust font size for "Mints" text
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_steps.length, (index) {
                      List<Widget> rowChildren = [
                        // Build step
                        _buildStep(
                          context,
                          isActive: index <= _currentStep,
                          label: _steps[index],
                          svgIcon: _icons[index],
                          activeColor: Colors.purple,
                          inactiveColor: Colors.grey,
                        ),
                      ];

                      // Add line
                      if (index < _steps.length - 1) {
                        rowChildren.add(
                          _buildLine(isActive: index < _currentStep),
                        );
                      }

                      return Row(
                        children: rowChildren,
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(children: [
                      Image.asset(
                        "assets/images/adresstrack_img.png",
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
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
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/images/adress_text.png",
                            width: 165,
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/cus-service_img.png",
                              height: 50,
                              width: screenWidth * 0.1,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Customer Service",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 21,
                                      color: Color.fromARGB(255, 188, 55, 222),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "023 6526 5236",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        "assets/icons/wassapp_icon.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "256 5416 5416",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        "assets/icons/phone_purpicon.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Person Details:",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  "assets/images/delProfile_img.png"),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Marcus Stanton",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Contact Number
                                      Text(
                                        "+253 02163 023",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Phone Icon
                                      SvgPicture.asset(
                                        "assets/icons/phone_purpicon.svg",
                                        height: 24,
                                        width: 24,
                                      ),
                                    ],
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
                SizedBox(height: 10),
                Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage("assets/images/mc_img.png"),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lorem ipsum dolor sit amet",
                                style: GoogleFonts.montserrat(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Bakery - Coffee Shop",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/phone_purpicon.svg",
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  color: Color.fromARGB(255, 246, 235, 249),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.32,
                            child: ListView.builder(
                              itemCount: cartImages
                                  .length, // Number of items in the list
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              cartImages[index],
                                              width: screenWidth * 0.15,
                                              height: 50,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "\$ 2.99",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 4.0),
                                                Text(
                                                  "Lorem ipsum dolor sit amet",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "QTY",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "2",
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Charge",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Amount",
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
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: screenWidth * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(11),
                              bottomRight: Radius.circular(11),
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5.0, left: 33),
                                child: SvgPicture.asset(
                                  "assets/icons/wallet_icon.svg",
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Cash On Delivery",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: _moveToNextStep,
                  child: Container(
                    height: 50,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(49),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

Widget _buildStep(BuildContext context,
    {required bool isActive,
    required String label,
    required String svgIcon,
    required Color activeColor,
    required Color inactiveColor}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? activeColor : inactiveColor.withOpacity(0.3),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(
            svgIcon,
            color: isActive ? Colors.white : inactiveColor,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.purple : Colors.grey,
        ),
      ),
    ],
  );
}

Widget _buildLine({required bool isActive}) {
  return Container(
    height: 3,
    color: isActive ? Colors.purple : Colors.grey[300],
    width: 56.0,
    margin: EdgeInsets.only(bottom: 15),
  );
}
