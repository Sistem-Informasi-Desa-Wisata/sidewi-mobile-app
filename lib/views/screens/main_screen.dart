import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/screens/favorite_screen.dart';
import 'package:sidewi_mobile_app/views/screens/home_screen.dart';
import 'package:sidewi_mobile_app/views/screens/notification_screen.dart';
import 'package:sidewi_mobile_app/views/screens/profile_screen.dart';
import 'package:sidewi_mobile_app/views/screens/login_screen.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      if (!authViewModel.isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

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
              icon: SvgPicture.asset(_selectedIndex == 0
                  ? 'assets/icons/ic_home_active.svg'
                  : 'assets/icons/ic_home_nonactive.svg'),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 1
                  ? 'assets/icons/ic_bottom_love_active.svg'
                  : 'assets/icons/ic_bottom_love_nonactive.svg'),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 2
                  ? 'assets/icons/ic_notification_active.svg'
                  : 'assets/icons/ic_notification_nonactive.svg'),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 3
                  ? 'assets/icons/ic_profile_active.svg'
                  : 'assets/icons/ic_profile_nonactive.svg'),
              label: "Profile"),
        ],
      ),
    );
  }
}
