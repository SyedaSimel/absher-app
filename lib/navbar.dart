import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  final Function(int) onTabSelected;
  const NavBar({required this.onTabSelected, Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 244, 244), // Background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), // Rounded corners
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6), // Shadow color
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white, // Navbar color
        notchMargin: 10, // Space around FAB notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTabItem(0, "assets/icons/home_icon.svg", "Home"),
            _buildTabItem(1, "assets/icons/search_icon.svg", "Search"),
            const SizedBox(width: 40), // Space for FAB
            _buildTabItem(3, "assets/icons/heart_icon.svg", "Notifications"),
            _buildTabItem(4, "assets/icons/nav_user_icon.svg", "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String iconPath, String label) {
    return IconButton(
      onPressed: () {
        if (index == 2) return; // Prevent FAB tab action
        _onItemTapped(index);
      },
      icon: SvgPicture.asset(
        iconPath,
        color: _selectedIndex == index ? Colors.purple : Colors.grey,
        height: 29,
        width: 29,
      ),
    );
  }
}
