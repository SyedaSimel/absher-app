import 'package:absher_flutter/pages/cart_screen/cart_screen.dart';
import 'package:absher_flutter/pages/notification_screen/notification_screen.dart';
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

    // List of grid items
    final List<Map<String, String>> gridItems = [
      {"image": "assets/images/burger_img.jpg", "text": "Restaurant"},
      {"image": "assets/images/store_img.jpg", "text": "Store"},
      {"image": "assets/images/pharmacy_img.jpg", "text": "Pharmacy"},
      {"image": "assets/images/service_img.jpg", "text": "Service"},
    ];

    // List of top pick items
    final List<Map<String, String>> topPicktems = [
      {"image": "assets/images/past_order_img.png", "text": "Past Order"},
      {"image": "assets/images/past_order_img.png", "text": "Offers"},
      {"image": "assets/images/past_order_img.png", "text": "Happy Hour"},
      {"image": "assets/images/past_order_img.png", "text": "Absha"},
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.04,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/Pin_fill.svg',
                            width: screenWidth * 0.04,
                            height: screenWidth * 0.04,
                          ),
                        ),
                        hintText: "Location",
                        hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.purple,
                          fontSize: screenWidth * 0.045,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
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
            width: screenWidth,
            height: screenHeight * 0.3, // Set a maximum height dynamically
            fit: BoxFit.cover, // Ensure the image covers its container
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
                fontSize: screenWidth * 0.05,
              ),
            ),
          ),

          // Grid View Section
          Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.03), // Dynamic padding
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width ~/
                    180), // Adjust items per row
                crossAxisSpacing:
                    MediaQuery.of(context).size.width * 0.02, // Dynamic spacing
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
              scrollDirection:
                  Axis.horizontal, // Allow horizontal scrolling if needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  topPicktems.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          // horizontal: MediaQuery.of(context).size.width *
                          // 0.02, // Adjusted spacing
                          ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.25, // Ensure widgets fit within screen
                        child: TopPicksWidget(
                          imagePath: topPicktems[index]["image"]!,
                          text: topPicktems[index]["text"]!,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

// "Restaurants nearby" section with adjusted spacing
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
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
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your action here
                  },
                  child: Text(
                    "See All",
                    style: GoogleFonts.montserrat(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ),

// Horizontal ListView for cards
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height *
                  0.02, // Responsive vertical spacing
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
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lorem Ipsum',
                                  style: TextStyle(
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
                                      width: MediaQuery.of(context).size.width *
                                          0.045,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(
                                      "Place Name",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    "assets/images/card_img.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                  ),
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right:
                                      MediaQuery.of(context).size.width * 0.02,
                                  child: SvgPicture.asset(
                                    "assets/icons/heartfill_icon.svg",
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                    height: MediaQuery.of(context).size.width *
                                        0.04,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
