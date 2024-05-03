import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/ui/screens/main_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/register_screen.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
// Background Section
        Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: double.infinity,
          child: SizedBox(
            child:
                Image(image: AssetImage('assets/images/logo_background.png')),
          ),
        ),

// Main Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SizedBox(
                        height: 64,
                        width: 194,
                        child: Image.asset(
                          'assets/images/fixLogo.png',
                          filterQuality: FilterQuality.none,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 273,
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
                      height: 120,
                    ),

                    // Input Section
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 32),
                            child: Container(
                              width: 312,
                              height: 154,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: InputTextWdiget(
                                        desc: "Email",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child:
                                          InputPasswordWdiget(desc: "Password"),
                                    ),
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
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,
                                        1), // Perpindahan bayangan pada sumbu x dan y
                                    blurRadius: 24, // Besarnya blur
                                    spreadRadius:
                                        12, // Jarak penyebaran bayangan dari objek
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

                    // Button Section
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                child: ButtonMainWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                            );
                          },
                          label: "Masuk",
                        )))
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Container(
                          width: 154,
                          height: 35,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Atau belum punya akun?\n',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Buat akun sekarang',
                                  style: TextStyle(
                                      color: MyColors.SecondaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.bottomCenter,
                child: TextCopyRight(),
              ))
            ],
          ),
        )
      ]),
    );
  }
}
