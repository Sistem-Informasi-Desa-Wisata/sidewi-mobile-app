import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/provider/desa_provider.dart';
import 'package:sidewi_mobile_app/provider/login_provider.dart';
import 'package:sidewi_mobile_app/provider/register_provider.dart';
import 'package:sidewi_mobile_app/repository/user_repository.dart';
import 'package:sidewi_mobile_app/services/api_service.dart';
import 'package:sidewi_mobile_app/ui/screens/detail_berita.dart';
import 'package:sidewi_mobile_app/ui/screens/detail_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/detail_wisata.dart';
import 'package:sidewi_mobile_app/ui/screens/fake_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/home_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/list_desa_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/login_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/final_regis_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/main_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/register_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/review_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/searching_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/upload_foto_register.dart';
import 'package:sidewi_mobile_app/ui/widgets/ReviewCardWidget.dart';
import 'package:sidewi_mobile_app/ui/widgets/berita_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/destinasi_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/detail_desa_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/produk_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/webView_map_wdiget.dart';
import 'package:sidewi_mobile_app/ui/widgets/wisata_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(UserRepository(ApiService())),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(UserRepository(ApiService())),
        ),
        ChangeNotifierProvider(create: (_) => DesaProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DefaultHome(),
      ),
    );
  }
}

class DefaultHome extends StatelessWidget {
  const DefaultHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: MainScreen());
  }
}
