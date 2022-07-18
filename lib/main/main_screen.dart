import 'package:flutter/material.dart';

import '../constants.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 4;

  final int iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Scaffold(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.smart_display_outlined,
              size: 30,
            ),
            activeIcon: Icon(Icons.smart_display),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall_outlined),
            activeIcon: Icon(Icons.local_mall),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(profileImage),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
