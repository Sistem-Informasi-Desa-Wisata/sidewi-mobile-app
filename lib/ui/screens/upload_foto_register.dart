import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/screens/final_regis_screen.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/upload_box.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';

class UploadFotoRegis extends StatelessWidget {
  const UploadFotoRegis({super.key});

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
            padding: EdgeInsets.only(left: 24, right: 24, top: 64, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ButtonBackWidget(),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Buat Akun",
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                        height: 16 / 16,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                SizedBox(
                  height: 69,
                ),
                Text(
                  "Langkah 2 dari 2",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                    height: 8 / 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Ayo buat akun kamu",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      height: 16 / 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "Masukan foto profil anda",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                    height: 12 / 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64),
                      child: Center(
                          child: Container(
                              height: 264, width: 264, child: UploadBox())),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonMainWidget(
                        label: "Lewati",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinalRegisScreen()),
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
