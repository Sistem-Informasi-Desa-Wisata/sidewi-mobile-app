import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextWdiget extends StatefulWidget {
  const InputTextWdiget({
    super.key,
    required this.desc,
    required this.onValueChanged,
  });

  final String desc;
  final void Function(String) onValueChanged;

// State
  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWdiget> {
  bool _isFocused = false;
  TextEditingController _controller = TextEditingController();

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
              controller: _controller,
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
              onChanged: (value) {
                widget.onValueChanged(value);
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

// input Email Widget
class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget(
      {Key? key, required this.desc, required this.onValueChanged})
      : super(key: key);

  final String desc;
  final void Function(String) onValueChanged;

  @override
  _InputEmailWidgetState createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {
  bool _isFocused = false;
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return false; // Email is required
    }
    if (!value.contains('@')) {
      return false; // Invalid email
    }
    return true; // Valid email
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 24,
                    spreadRadius: 4,
                    color: Color(0x0D000000),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _emailController,
                onTap: () {
                  setState(() {
                    _isFocused = true;
                  });
                },
                onFieldSubmitted: (_) {
                  setState(() {
                    _isFocused = false;
                  });
                },
                onChanged: (value) {
                  widget.onValueChanged(value);
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
                  suffixIcon:
                      !_validateEmail(_emailController.text) && _isFocused
                          ? Icon(
                              Icons.error,
                              color: Colors.red,
                            ) // Tidak ada ikon jika email valid
                          : null,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 9),
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

class InputPasswordWdiget extends StatefulWidget {
  const InputPasswordWdiget(
      {super.key, required this.desc, required this.onValueChanged});

  final String desc;
  final void Function(String) onValueChanged;

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWdiget> {
  bool _isFocused = false;
  bool _obscureText = true;
  TextEditingController _passwordController = TextEditingController();

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
              controller: _passwordController,
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
              onChanged: (value) {
                widget.onValueChanged(value);
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
