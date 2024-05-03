import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextWdiget extends StatefulWidget {
  const InputTextWdiget({super.key, required this.desc});

  final String desc;

// State
  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWdiget> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset:
                      Offset(0, 1), // Perpindahan bayangan pada sumbu x dan y
                  blurRadius: 24, // Besarnya blur
                  spreadRadius: 4, // Jarak penyebaran bayangan dari objek
                  color: Color(
                      0x0D000000), // Warna bayangan dengan opacity (alpha) 0D
                ),
              ],
            ),
            child: TextField(
              onTap: () {
                setState(() {
                  _isFocused = true;
                });
              },
              onSubmitted: (_) {
                setState(() {
                  _isFocused = false;
                });
              },
              onChanged: (_) {
                setState(() {
                  _isFocused = true;
                });
              },
              decoration: InputDecoration(
                labelText: widget.desc,
                labelStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9fa5a9),
                  height: 16 / 12,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// input password widget

class InputPasswordWdiget extends StatefulWidget {
  const InputPasswordWdiget({super.key, required this.desc});

  final String desc;

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWdiget> {
  bool _isFocused = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            width: 288,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset:
                      Offset(0, 1), // Perpindahan bayangan pada sumbu x dan y
                  blurRadius: 24, // Besarnya blur
                  spreadRadius: 4, // Jarak penyebaran bayangan dari objek
                  color: Color(
                      0x0D000000), // Warna bayangan dengan opacity (alpha) 0D
                ),
              ],
            ),
            child: TextField(
              onTap: () {
                setState(() {
                  _isFocused = true;
                });
              },
              onSubmitted: (_) {
                setState(() {
                  _isFocused = false;
                });
              },
              obscureText: _obscureText,
              obscuringCharacter: '•',
              decoration: InputDecoration(
                labelText: widget.desc,
                labelStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9fa5a9),
                  height: 16 / 12,
                ),
                filled: true,
                fillColor: Colors.white,
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
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    _obscureText
                        ? 'assets/icons/ic_password_hidden.svg'
                        : 'assets/icons/ic_paswword_visible.svg',
                    height: 16,
                    width: 16,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
