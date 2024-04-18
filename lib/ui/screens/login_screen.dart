import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/text_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 56,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonBackWidget(),
              SizedBox(
                height: 20,
              ),
              Center(child: Image.asset('assets/images/logoDummy.png')),
              TextHeaderWidget(),
              InputEmailWdiget(label: "Email", desc: "Enter Your Email"),
              SizedBox(
                height: 16,
              ),
              InputPasswordWdiget(
                  label: "Password", desc: "Enter Your Password"),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9fa5a9),
                      height: 16 / 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ButtonMainWidget(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "Or login with",
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9fa5a9),
                        height: 16 / 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 2,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonSecondaryWidget(
                      icon: 'assets/icons/ic_facebook.svg',
                    ),
                    ButtonSecondaryWidget(icon: 'assets/icons/ic_gogle.svg'),
                    ButtonSecondaryWidget(icon: 'assets/icons/ic_apple.svg'),
                  ],
                ),
              ),
              RichText(text: TextSpan(style: TextStyle(color: Colors.black)))
            ],
          )),
    );
  }
}
