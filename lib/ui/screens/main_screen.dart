import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/ui/screens/favorite_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/home_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/notification_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTap(int nomor) {
    setState(() {
      _selectedIndex = nomor;
    });
  }

  List<Widget> screen = [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.video_call
                  : Icons.video_call_outlined),
              label: "Live"),
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 3 ? Icons.shop : Icons.shop_outlined),
              label: "Shop"),
        ],
      ),
    );
  }
}
