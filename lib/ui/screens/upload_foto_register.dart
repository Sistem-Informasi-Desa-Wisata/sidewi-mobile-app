import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/provider/register_provider.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/screens/final_regis_screen.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/upload_box.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';

class UploadFotoRegis extends StatelessWidget {
  UploadFotoRegis({
    super.key,
    required this.nama,
    required this.noTelp,
    required this.email,
    required this.password,
  });

  final String nama;
  final String noTelp;
  final String email;
  final String password;

  File? _selectedImage;

  void _handleImageSelected(File? foto) {
    _selectedImage = foto;
  }

  @override
  Widget build(BuildContext context) {
    print("username :$nama, email :$email, password :$password");
    // Deklarasi provider

    // fungsi request api

    final registerProvider = Provider.of<RegisterProvider>(context);

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
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ButtonBackWidget()),
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

// Upload Foto
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64),
                      child: Center(
                          child: Container(
                              height: 264,
                              width: 264,
                              child: UploadBox(
                                onImageSelected: _handleImageSelected,
                              ))),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (registerProvider.isLoading)
                        CircularProgressIndicator(),
                      if (!registerProvider.isLoading)
                        ButtonMainWidget(
                          onPressed: () async {
                            // _onButtonPressed(context, _selectedImage);
                            await registerProvider.register(
                                nama, noTelp, email, password);

                            if (registerProvider.message != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(registerProvider.message!),
                                ),
                              );
                            }
                            if (registerProvider.isSuccess) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FinalRegisScreen()));
                            }
                          },
                          label: "Lewati",
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
