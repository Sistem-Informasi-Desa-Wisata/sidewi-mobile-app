import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/provider/register_provider.dart';
import 'package:sidewi_mobile_app/provider/register_provider.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';
import 'package:sidewi_mobile_app/ui/screens/login_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/main_screen.dart';
import 'package:sidewi_mobile_app/ui/screens/upload_foto_register.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _usernameCotroller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordColtroller = TextEditingController();
  final TextEditingController _notelponController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // File? _foto;

  @override
  Widget build(BuildContext context) {
    // Deklarasi provider
    final registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
// Background Section
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/logo_background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

// Content Section
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 68),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: ButtonBackWidget()),
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
                    //  Heading Description
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
                      height: 8,
                    ),

// Form Section
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: InputTextWdiget(
                        desc: "Nama pengguna",
                        controller: _usernameCotroller,
                      ),
                    ),
                    InputTextWdiget(
                      desc: "Nomer Hp",
                      controller: _notelponController,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: InputEmailWidget(
                        desc: "Email",
                        controller: _emailController,
                      ),
                    ),
                    InputPasswordWdiget(
                      desc: "Password",
                      controller: _passwordColtroller,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InputPasswordWdiget(
                      desc: "Ulangi Password",
                      controller: _confirmPasswordController,
                    ),

// Button Submit
                    Padding(
                      padding: const EdgeInsets.only(top: 87),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonMainWidget(
                                label: "Lanjut",
                                onPressed: () {
                                  if (_usernameCotroller.text.isEmpty &&
                                      _notelponController.text.isEmpty &&
                                      _emailController.text.isEmpty &&
                                      _passwordColtroller.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Form tidak boleh kosong'),
                                    ));
                                  } else if (_passwordColtroller.text !=
                                      _confirmPasswordController.text) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Password Tidak Falid'),
                                    ));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UploadFotoRegis(
                                                  nama: _usernameCotroller.text,
                                                  noTelp:
                                                      _notelponController.text,
                                                  email: _emailController.text,
                                                  password:
                                                      _passwordColtroller.text,
                                                )));
                                  }
                                }),
                            // if (registerProvider.isLoading)
                            //   CircularProgressIndicator(),
                            // if (!registerProvider.isLoading)
                            //   ButtonMainWidget(
                            //     label: "Lanjut",
                            //     onPressed: () {
                            //       // Validasi input
                            //       if (_passwordColtroller.text ==
                            //           _confirmPasswordController.text) {
                            //         registerProvider
                            //             .register(
                            //                 _usernameCotroller.text,
                            //                 _passwordColtroller.text,
                            //                 _emailController.text,
                            //                 _notelponController.text)
                            //             .then((_) {
                            //           // Check if there's a message to show in Snackbar
                            //           if (registerProvider.message != null) {
                            //             ScaffoldMessenger.of(context)
                            //                 .showSnackBar(
                            //               SnackBar(
                            //                 content:
                            //                     Text(registerProvider.message!),
                            //               ),
                            //             );
                            //           }
                            //         });
                            //       } else {
                            //         // Tampilkan pesan error jika password tidak sama
                            //         ScaffoldMessenger.of(context).showSnackBar(
                            //           const SnackBar(
                            //             content: Text('Password tidak cocok'),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            const SizedBox(height: 17),
                            TextCopyRight(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
