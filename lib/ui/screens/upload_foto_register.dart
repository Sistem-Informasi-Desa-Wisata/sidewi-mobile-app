import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.registerProvider,
  });

  final String nama;
  final String email;
  final String password;
  final String confirmPassword;

  final RegisterProvider registerProvider;

  File? _selectedImage;

  void _handleImageSelected(File? foto) {
    _selectedImage = foto;
  }

  void _onButtonPressed(BuildContext context, File? foto) async {
    // Membuat instance RegisterRequestModel dengan data yang diperlukan
    RegisterRequestModel request = RegisterRequestModel(
      nama: nama,
      email: email,
      password: password,
      foto: foto, // Menggunakan foto yang diterima dari parameter
    );

    // Melakukan proses registrasi dengan memanggil metode register dari registerProvider
    try {
      await registerProvider.register(request);

      // Navigasi ke halaman akhir registrasi jika registrasi berhasil
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FinalRegisScreen()),
      );
    } catch (e) {
      // Menampilkan pesan error jika terjadi kesalahan saat registrasi
      print('Error during registration: $e');
      // Menampilkan pesan kesalahan ke pengguna
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to register. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        "username :$nama, email :$email, password :$password, confirmPassword :$confirmPassword");
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
                      ButtonMainWidget(
                        label: "Lewati",
                        onPressed: () {
                          _onButtonPressed(context, _selectedImage);
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
