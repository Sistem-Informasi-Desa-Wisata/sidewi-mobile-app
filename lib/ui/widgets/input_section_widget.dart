import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputEmailWdiget extends StatelessWidget {
  const InputEmailWdiget({super.key, required this.label, required this.desc});

  final String label;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.mainGrey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: Colors.grey), // Outline saat tidak di-fokus
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Colors.blue), // Outline saat di-fokus
                ),
                hintText: desc,
                hintStyle: TextStyle(
                  fontSize: 12, // Ukuran teks 12
                  fontWeight: FontWeight.w400, // Bobot font 400 (normal)
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// input password widget

class InputPasswordWdiget extends StatelessWidget {
  const InputPasswordWdiget(
      {super.key, required this.label, required this.desc});

  final String label;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: 40,
            child: TextField(
              obscureText: true,
              obscuringCharacter: '•',
              decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.mainGrey,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintText: desc,
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/ic_password.svg',
                    height: 16,
                    width: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
