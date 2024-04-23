import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/ui/screens/fake_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/final_regis_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/login_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/register_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/upload_foto_register.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadFotoRegis();
  }
}
