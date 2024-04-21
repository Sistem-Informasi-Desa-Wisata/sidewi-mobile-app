import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_decoration.jpeg'),
              fit: BoxFit
                  .cover, // Mengisi container dengan gambar tanpa mempertahankan aspek rasio
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Image.asset(
                      'assets/images/logoBaru.png',
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                  SizedBox(
                    width: 256,
                    height: 50,
                    child: Text(
                      "Rasakan pesona desa yang mempesona dengan alam yang indah, budaya yang kaya, dan keramahan penduduknya!",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Container(
                            child: Column(
                              children: [
                                InputEmailWdiget(
                                  label: "Email",
                                  desc: "Email",
                                ),
                                InputPasswordWdiget(
                                    label: "Password", desc: "Password"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextSecondary(
                                      text: "Forgot password?",
                                    )
                                  ],
                                )
                              ],
                            ),
                            height: 152,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0,
                                      1), // Perpindahan bayangan pada sumbu x dan y
                                  blurRadius: 10, // Besarnya blur
                                  spreadRadius:
                                      1, // Jarak penyebaran bayangan dari objek
                                  color: Color(
                                      0x0D000000), // Warna bayangan dengan opacity (alpha) 0D
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              child: ButtonMainWidget(
                        label: "Masuk",
                      )))
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "atau",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                          height: 15 / 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              child: ButtonRectangleWidget(
                        label: "Buat Akun",
                      )))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
