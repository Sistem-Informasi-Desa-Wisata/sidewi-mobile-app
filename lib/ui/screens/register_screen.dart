import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/provider/register_provider.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';
import 'package:sidewi_mobile_app/ui/screens/upload_foto_register.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  String nama = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  void _handleUsernameChanged(String value) {
    nama = value;
  }

  void _handleEmailChanged(String value) {
    email = value;
  }

  void _handlePasswordChanged(String value) {
    password = value;
  }

  void _handleConfirmPasswordChanged(String value) {
    confirmPassword = value;
  }

  @override
  Widget build(BuildContext context) {
    // RegisterProvider registerProvider = RegisterProvider(APIService());
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
                InputTextWdiget(
                  desc: "Nama pengguna",
                  onValueChanged: _handleUsernameChanged,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: InputEmailWidget(
                    desc: "Email",
                    onValueChanged: _handleEmailChanged,
                  ),
                ),
                InputPasswordWdiget(
                  desc: "Password",
                  onValueChanged: _handlePasswordChanged,
                ),
                SizedBox(
                  height: 24,
                ),
                InputPasswordWdiget(
                  desc: "Ulangi Password",
                  onValueChanged: _handleConfirmPasswordChanged,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonMainWidget(
                        label: "Lanjut",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadFotoRegis(
                                      nama: nama,
                                      email: email,
                                      password: password,
                                      confirmPassword: confirmPassword,
                                      // registerProvider: registerProvider,
                                    )),
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
