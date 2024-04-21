import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputEmailWdiget extends StatelessWidget {
  const InputEmailWdiget({super.key, required this.label, required this.desc});

  final String label;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              width: 288,
              child: TextField(
                decoration: InputDecoration(
                  labelText: desc,
                  labelStyle: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9fa5a9),
                    height: 16 / 12,
                  ),
                  filled: true,
                  fillColor: MyColors.mainGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Colors.white), // Outline saat tidak di-fokus
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.blue), // Outline saat di-fokus
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 9),
                ),
              ),
            ),
          ),
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              width: 288,
              child: TextField(
                obscureText: true,
                obscuringCharacter: '•',
                decoration: InputDecoration(
                  labelText: desc,
                  labelStyle: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9fa5a9),
                    height: 16 / 12,
                  ),
                  filled: true,
                  fillColor: MyColors.mainGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: Colors.white), // Outline saat tidak di-fokus
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.blue), // Outline saat di-fokus
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 9),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/icons/ic_password_close.svg',
                      height: 12,
                      width: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
