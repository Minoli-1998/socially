import 'package:flutter/material.dart';
import 'package:socially_app/views/main_screens/add_new_screen.dart';
import 'package:socially_app/views/main_screens/home_screen.dart';
import 'package:socially_app/views/main_screens/profile_screen.dart';
import 'package:socially_app/views/main_screens/reels_screen.dart';
import 'package:socially_app/views/main_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // fields
  int _currentIndex = 2;
  final _pages = [
    HomeScreen(),
    SearchUsersScreen(),
    CreatePostScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  void _onItemChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => _onItemChange(value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Reels",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: _pages[_currentIndex],
    );
  }
}
