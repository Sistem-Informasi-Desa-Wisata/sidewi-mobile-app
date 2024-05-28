import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/text_widget.dart';

class FakeScreen extends StatelessWidget {
  const FakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}

class FakeLoginScreen extends StatelessWidget {
  const FakeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: SvgPicture.asset(
                'assets/icons/ic_circle_decoration1.svg',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: SvgPicture.asset(
                'assets/icons/ic_circle_decoration2.svg',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
