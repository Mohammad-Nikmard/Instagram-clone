import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/screens/explore_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _selectedIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Container(
          height: 68,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF272B40),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("images/icon_home.png"),
                activeIcon: Image.asset("images/icon_active_home.png"),
                label: "main",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("images/icon_search_navigation.png"),
                activeIcon:
                    Image.asset("images/icon_search_navigation_active.png"),
                label: "main",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("images/icon_add_navigation.png"),
                activeIcon:
                    Image.asset("images/icon_add_navigation_active.png"),
                label: "main",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("images/icon_activity_navigation.png"),
                activeIcon:
                    Image.asset("images/icon_activity_navigation_active.png"),
                label: "main",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: textColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset("images/my_profile.jpg"),
                ),
                activeIcon: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: buttonColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset("images/my_profile.jpg"),
                ),
                label: "main",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        children: [
          HomeScreen(),
          ExploreScreen(),
          AddPostScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
        index: _selectedIndex,
      ),
    );
  }
}
