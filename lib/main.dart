import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/destinasiwisata_viewmodel.dart';
import 'package:sidewi_mobile_app/views/screens/detail_desa_screen.dart';
import 'package:sidewi_mobile_app/views/screens/kelolaakun_screen.dart';
import 'package:sidewi_mobile_app/views/screens/list_desa_screen.dart';
import 'package:sidewi_mobile_app/views/screens/welcome_screen.dart';
import 'views/screens/favorite_screen.dart';
import 'views/screens/final_regis_screen.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/notification_screen.dart';
import 'views/screens/profile_screen.dart';
import 'views/screens/register_screen.dart';
import 'views/screens/upload_foto_register.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/review_viewmodel.dart';
import 'viewmodels/user_viewmodel.dart';
import 'viewmodels/desawisata_viewmodel.dart';
import 'views/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DesaWisataViewModel()),
        ChangeNotifierProvider(create: (_) => DestinasiWisataViewModel()),
        ChangeNotifierProvider(create: (_) => ReviewViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProxyProvider<AuthViewModel, UserViewModel>(
          create: (_) =>
              UserViewModel(Provider.of<AuthViewModel>(_, listen: false)),
          update: (_, authViewModel, userViewModel) =>
              UserViewModel(authViewModel),
        ),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          return MaterialApp(
            // home: DetailScreen(id: 1),
            home: authViewModel.user != null ? MainScreen() : WelcomeScreen(),
            routes: {
              '/main': (context) => MainScreen(),
              '/login_screen': (context) => LoginScreen(),
              '/register-screen': (context) => RegisterScreen(),
              '/finalregister-screen': (context) => FinalRegisScreen(),
              '/uploadfotoregister-screen': (context) => UploadFotoRegis(
                    userData: ModalRoute.of(context)!.settings.arguments
                        as Map<String, dynamic>,
                  ),
              '/home_screen': (context) => HomeScreen(),
              '/favorite_screen': (context) => FavoriteScreen(),
              '/notif_screen': (context) => NotificationScreen(),
              '/profile_screen': (context) => ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}

class TestingHome extends StatelessWidget {
  const TestingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: MainScreen());
  }
}
