import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sidewi_mobile_app/views/screens/login_screen.dart';
import 'package:sidewi_mobile_app/views/screens/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Lottie.asset(
              'assets/lotties/logo.json',
            ),
          ),
        ),
      ),
    );
  }
}
