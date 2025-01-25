import 'package:absher_flutter/pages/cart_screen/cart_screen.dart';
import 'package:absher_flutter/pages/notification_screen/notification_screen.dart';
import 'package:absher_flutter/pages/profile_screen/balance_screen.dart';
import 'package:absher_flutter/pages/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navbar.dart';
import '../search_screen/search_screen.dart';
import 'package:absher_flutter/pages/homepage/grid_widget.dart';
import 'package:absher_flutter/pages/homepage/top_picks_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchScreen(),
    CartScreen(),
    NotificationScreen(),
    ProfileScreen(),
    BalanceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTabIndex],
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentTabIndex = 2;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            "assets/icons/cart_icon.svg",
            color: _currentTabIndex == 2 ? Colors.purple : Colors.grey,
            height: 27,
            width: 27,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBar(
        onTabSelected: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isHorizontal =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // List of grid items
    final List<Map<String, String>> gridItems = [
      {"image": "assets/images/burger_img.jpg", "text": "Restaurant"},
      {"image": "assets/images/store_img.jpg", "text": "Store"},
      {"image": "assets/images/pharmacy_img.jpg", "text": "Pharmacy"},
      {"image": "assets/images/service_img.jpg", "text": "Services"},
    ];

    // List of top pick items
    final List<Map<String, String>> topPicktems = [
      {"image": "assets/images/past_order_img.png", "text": "Past Order"},
      {"image": "assets/images/offers.png", "text": "Offers"},
      {"image": "assets/images/happy.png", "text": "Happy Hour"},
      {"image": "assets/images/choices.png", "text": "Absha"},
    ];

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 0.5, // Add light elevation
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(
                                'assets/icons/Pin_fill.svg',
                                height: 10,
                              ),
                            ),
                            hintText: "Location",
                            hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.purple,
                              fontSize: screenWidth * 0.045,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02), // Responsive spacing
                  IconButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/bell_icon.svg',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Spacing before the image
            SizedBox(height: screenHeight * 0.01), // Adjust spacing dynamically

            // Image
            Image.asset(
              "assets/images/rolls_img.png",
              width: isHorizontal
                  ? screenWidth
                  : screenWidth, // Adjust width for horizontal screens
              height: isHorizontal
                  ? screenHeight * 0.5 // Increase height for horizontal
                  : screenHeight * 0.3, // Decrease height for vertical
              fit: BoxFit.cover, // Ensure the image covers the container
            ),

            // Spacing between the image and the next text
            SizedBox(height: screenHeight * 0.02),

            // Welcome Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                "Welcome to Absher",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: screenWidth * 0.048,
                ),
              ),
            ),

            // Grid View Section
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.04), // Dynamic padding
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).size.width ~/
                      180), // Adjust items per row
                  crossAxisSpacing: MediaQuery.of(context).size.width *
                      0.02, // Dynamic spacing
                  mainAxisSpacing: MediaQuery.of(context).size.height *
                      0.02, // Dynamic spacing
                  childAspectRatio: 0.9, // Adjust aspect ratio of grid items
                ),
                itemCount: gridItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridWidgetBox(
                    imagePath: gridItems[index]["image"]!,
                    text: gridItems[index]["text"]!,
                  );
                },
              ),
            ),

            // Top Picks Widget Section
            Padding(
              padding: EdgeInsets.symmetric(
                // horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height *
                    0.01, // Reduced vertical padding
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Allow horizontal scrolling if needed

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13, bottom: 10),
                        child: Text(
                          "Top Picks",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          topPicktems.length,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width *
                                    0.005, // Adjusted spacing
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.23, // Ensure widgets fit within screen
                                child: TopPicksWidget(
                                  imagePath: topPicktems[index]["image"]!,
                                  text: topPicktems[index]["text"]!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
            ),

            // "Restaurants nearby" section with adjusted spacing
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                // vertical: MediaQuery.of(context).size.height * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Restaurants nearby",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: screenWidth * 0.047,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your action here
                    },
                    child: Text(
                      "View All",
                      style: GoogleFonts.montserrat(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.01, // Responsive vertical spacing
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.25, // Responsive height for cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.02, // Responsive spacing
                      ),
                      child: Card(
                        elevation: 0.5,
                        color:
                            Colors.white, // Set card background color to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lorem Ipsum',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/Pin_fill.svg",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text(
                                        "Place Name",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.grey,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                // Card Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    "assets/images/card_img.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                  ),
                                ),
                                // Positioned Heart Icon
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.width * 0.02,
                                  child: SvgPicture.asset(
                                    "assets/icons/heartfill_icon.svg",
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    color: Colors.white,
                                  ),
                                ),
                                // Positioned Star Rating and Text
                                Positioned(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.035,
                                  left:
                                      MediaQuery.of(context).size.width * 0.03,
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/rating_icon.svg",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.purple,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2, left: 2),
                                        child: SvgPicture.asset(
                                          "assets/icons/star_icon.svg",
                                          height: 14,
                                        ),
                                      ),
                                      Positioned(
                                        top: 3.2,
                                        left: 20,
                                        child: Text(
                                          "4.6",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Positioned Row for Delivery Information
                                Positioned(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.01,
                                  left:
                                      MediaQuery.of(context).size.width * 0.03,
                                  child: Row(
                                    children: [
                                      // Clock Icon and Text
                                      SvgPicture.asset(
                                        "assets/icons/greyclock_icon.svg",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.white,
                                      ),
                                      // SizedBox(
                                      //     width: MediaQuery.of(context)
                                      //             .size
                                      //             .width *
                                      //         0.02),
                                      Text(
                                        "40-50 Mins",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
                                        ),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      // Distance Icon and Text
                                      SvgPicture.asset(
                                        "assets/icons/jumptime_icon.svg",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.white,
                                      ),

                                      Text(
                                        "9.5 km",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
                                        ),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      // Delivery Man Icon and Text
                                      SvgPicture.asset(
                                        "assets/icons/delman_icon.svg",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: Colors.white,
                                      ),

                                      Text(
                                        "\$2",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
