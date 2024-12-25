import 'package:flutter/material.dart';
import 'package:foodie/screens/account.dart';
import 'package:foodie/screens/cart.dart';
import 'package:foodie/screens/explore.dart';
import 'package:foodie/screens/homescreen.dart';

class Nn extends StatefulWidget {
  const Nn({super.key});

  @override
  State<Nn> createState() => _NnState();
}

class _NnState extends State<Nn> {
  int selectedindex = 0;
  PageController pageController = PageController();

  void ontap(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the main background color of the screen
      body: PageView(
        controller: pageController,
        children: const [Homescreen(), Explore(), Account()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,
        onTap: ontap,
        backgroundColor: Color(0xff000000).withOpacity(0.8),
        // Black with opacity for the bottom nav bar
        elevation: 5, // Shadow effect
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home', // Label for home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Explore icon
            label: 'Explore', // Label for explore
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), // Account icon
            label: 'Account', // Label for account
          ),
        ],
      ),
    );
  }
}
