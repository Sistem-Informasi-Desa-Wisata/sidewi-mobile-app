import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_back_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/button_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/input_section_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/text_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/destinasi_widget.dart';

class FakeScreen extends StatelessWidget {
  const FakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Outer Scaffold'),
        ),
        body: Center(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Inner Scaffold'),
            ),
            body: Center(
              child: Text('Content of Inner Scaffold'),
            ),
          ),
        ),
      ),
    );
  }
}
