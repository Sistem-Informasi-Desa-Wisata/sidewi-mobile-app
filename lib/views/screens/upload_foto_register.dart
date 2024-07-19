import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sidewi_mobile_app/views/screens/final_regis_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/copyRight.dart';
import 'package:sidewi_mobile_app/views/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/upload_box.dart';
import 'package:sidewi_mobile_app/views/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';

class UploadFotoRegis extends StatefulWidget {
  final Map<String, dynamic> userData;

  UploadFotoRegis({required this.userData});

  @override
  _UploadFotoRegisState createState() => _UploadFotoRegisState();
}

class _UploadFotoRegisState extends State<UploadFotoRegis> {
  // final Map<String, dynamic> userData;

  // final String nama;
  // final String noTelp;
  // final String email;
  // final String password;
  void _handleImageSelected(File? foto) {
    _selectedImage = foto;
  }

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }

  Future<void> _submit() async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    try {
      
      await authViewModel.register(widget.userData, _selectedImage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FinalRegisScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

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
                      if (authViewModel.loading) CircularProgressIndicator(),
                      if (!authViewModel.loading)
                        ButtonMainWidget(
                          onPressed: _submit,
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
