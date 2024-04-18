import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';

class ButtonMainWidget extends StatelessWidget {
  const ButtonMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Aksi yang akan dilakukan ketika tombol ditekan
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(MyColors.buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 48.0),
            ),
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ButtonSecondaryWidget extends StatelessWidget {
  const ButtonSecondaryWidget({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.mainGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 60,
      height: 32,
      child: IconButton(
          iconSize: 24,
          padding: EdgeInsets.zero,
          onPressed: null,
          icon: SvgPicture.asset(
            icon,
            width: 7.1,
            height: 15.84,
          )),
    );
  }
}
