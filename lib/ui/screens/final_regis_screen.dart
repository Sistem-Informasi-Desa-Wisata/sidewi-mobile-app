import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/ui/screens/main_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/home_screen.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/upload_box.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';

class FinalRegisScreen extends StatelessWidget {
  const FinalRegisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: double.infinity,
            child: SizedBox(
              child:
                  Image(image: AssetImage('assets/images/logo_background.png')),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 214),
                  child: Center(
                    child: SizedBox(
                        width: 156.99,
                        height: 164,
                        child: Image(
                            image: AssetImage('assets/images/sucsess.png'))),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "BERHASIL!",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                    height: 29 / 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Akun anda berhasil dibuat",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    height: 20 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonMainWidget(
                        label: "Masuk",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      TextCopyRight(),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
