import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/ui/screens/upload_foto_register.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ButtonBackWidget(),
                    SizedBox(
                      width: 16,
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
                  "Langkah 1 dari 2",
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
                Container(
                  width: 253,
                  height: 30,
                  child: Text(
                    "Masukan nama pengguna, alamat email\n" "dan password",
                    style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                        height: 14 / 12),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                InputTextWdiget(desc: "Nama pengguna"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: InputTextWdiget(
                    desc: "Email",
                  ),
                ),
                InputPasswordWdiget(desc: "Password"),
                SizedBox(
                  height: 24,
                ),
                InputPasswordWdiget(desc: "Ulangi Password"),
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
                                builder: (context) => UploadFotoRegis()),
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
