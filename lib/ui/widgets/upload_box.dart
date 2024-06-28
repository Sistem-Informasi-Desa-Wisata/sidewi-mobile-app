import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:image_picker/image_picker.dart';

class UploadBox extends StatefulWidget {
  const UploadBox({super.key, required this.onImageSelected});

  final void Function(File?) onImageSelected;

  @override
  _UploadBoxState createState() => _UploadBoxState();
}

class _UploadBoxState extends State<UploadBox> {
  File? _foto;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _foto = File(pickedFile.path);
      });
      widget.onImageSelected(_foto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 264,
            height: 264,
            child: Image.asset(
              'assets/images/dashBox.png',
              filterQuality: FilterQuality.none,
            )),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: GestureDetector(
              onTap: _getImage,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 260,
                height: 260,
                child: _foto == null
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: null,
                        icon: Image.asset(
                          'assets/images/foto.png',
                          width: 120,
                          height: 120,
                          filterQuality: FilterQuality.none,
                        ),
                      )
                    : Image.file(_foto!, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
