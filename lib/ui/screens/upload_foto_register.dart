import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
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
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 16 / 16,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Langkah 1 dari 3",
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
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      height: 16 / 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "Masukan nama pengguna, alamat email dan password ",
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
                      padding: const EdgeInsets.symmetric(vertical: 44),
                      child: Center(child: Container(child: UploadBox())),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                ButtonMainWidget(
                  label: "Lanjut",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FinalRegisScreen()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
