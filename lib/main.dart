import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/ui/screens/detail_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/fake_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/home_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/login_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/final_regis_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/main_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/register_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/upload_foto_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
=======
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(UserRepository(ApiService())),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(
              UserRepository(ApiService())), // Tambahkan LoginProvider
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          useMaterial3: true,
        ),
        home: DefaultHome(),
>>>>>>> Stashed changes
      ),
      home: DefaultHome(),
    );
  }
}

class DefaultHome extends StatelessWidget {
  const DefaultHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: DetailScreen());
  }
}
