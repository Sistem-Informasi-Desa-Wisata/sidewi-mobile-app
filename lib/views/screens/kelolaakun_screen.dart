import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/user_viewmodel.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:sidewi_mobile_app/views/widgets/input_section_widget.dart';

class KelolaAkunScreen extends StatefulWidget {
  @override
  _KelolaAkunScreenState createState() => _KelolaAkunScreenState();
}

class _KelolaAkunScreenState extends State<KelolaAkunScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final _namaController = TextEditingController();
  final _noHpController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _namaController.text = authViewModel.user?.nama ?? '';
    _noHpController.text = authViewModel.user?.no_telp ?? '';
    _emailController.text = authViewModel.user?.email ?? '';
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _updateUser() async {
    print("1");
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    String nama = _namaController.text.trim();
    String no_telp = _noHpController.text.trim();
    String? password = _passwordController.text.trim().isNotEmpty
        ? _passwordController.text.trim()
        : null;
    String? email = _emailController.text.trim();
    String? fotoPath = _imageFile?.path;

    try {
      if (authViewModel.isAuthenticated) {
        print("2");

        await userViewModel.updateUser(
          id: authViewModel.user!.id,
          nama: nama,
          no_telp: no_telp,
          email: email,
          password: password,
          fotoPath: fotoPath,
          accessToken: authViewModel.accessToken!,
        );

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User updated successfully'),
          duration: Duration(seconds: 2),
        ));

        Navigator.of(context).pop();
      } else {
        print("3");
        throw Exception('User data is null');
      }
    } catch (e) {
      print("4");

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update user: $e'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              maxHeight: 112,
              minHeight: 112,
              child: Container(
                height: 112,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                              'assets/icons/ic_back_black.svg')),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            child: Text(
                              "Kelola Akun",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                                height: 20 / 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<AuthViewModel>(
                builder: (context, authViewModel, child) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: _imageFile != null
                              ? FileImage(File(_imageFile!.path))
                              : authViewModel.user?.foto != null
                                  ? NetworkImage(
                                      '${ApiConfig.baseUrl}/resource/akun/${authViewModel.user!.foto}')
                                  : AssetImage(
                                          'assets/images/default_avatar.png')
                                      as ImageProvider,
                          child: _imageFile == null
                              ? Icon(Icons.camera_alt)
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Data diri",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                              height: 20 / 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          InputTextWdiget(
                            desc: "Nama pengguna",
                            controller: _namaController,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: InputTextWdiget(
                              desc: "Nomer HP",
                              controller: _noHpController,
                            ),
                          ),
                          InputTextWdiget(
                            desc: "panduanggi0899@gmail.com",
                            controller: _emailController,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: InputTextWdiget(
                              desc: "Password",
                              controller: _passwordController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GestureDetector(
                          onTap: () {
                            _updateUser();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 103, 244, 107),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0,
                                      1), // Perpindahan bayangan pada sumbu x dan y
                                  blurRadius: 24, // Besarnya blur
                                  spreadRadius:
                                      4, // Jarak penyebaran bayangan dari objek
                                  color: Color(
                                      0x0D000000), // Warna bayangan dengan opacity (alpha) 0D
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: 48,
                            child: Center(
                              child: Text(
                                "Simpan",
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  height: 20 / 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ]),
        ),
      ],

      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Consumer<AuthViewModel>(
      //     builder: (context, authViewModel, child) {
      //       return Column(
      //         children: [
      //           GestureDetector(
      //             onTap: _pickImage,
      //             child: CircleAvatar(
      //               radius: 40,
      //               backgroundImage: _imageFile != null
      //                   ? FileImage(File(_imageFile!.path))
      //                   : authViewModel.user?.foto != null
      //                       ? NetworkImage(
      //                           '${ApiConfig.baseUrl}/resource/akun/${authViewModel.user!.foto}')
      //                       : AssetImage('assets/images/default_avatar.png')
      //                           as ImageProvider,
      //               child: _imageFile == null ? Icon(Icons.camera_alt) : null,
      //             ),
      //           ),
      //           TextField(
      //             controller: _namaController,
      //             decoration: InputDecoration(labelText: 'Nama'),
      //           ),
      //           TextField(
      //             controller: _noHpController,
      //             decoration: InputDecoration(labelText: 'No HP'),
      //           ),
      //           TextField(
      //             controller: _emailController,
      //             decoration: InputDecoration(labelText: 'Email'),
      //           ),
      //           TextField(
      //             controller: _passwordController,
      //             decoration: InputDecoration(labelText: 'password'),
      //           ),
      //           SizedBox(height: 20),
      //           ElevatedButton(
      //             onPressed: _updateUser,
      //             child: Text('Update'),
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      // ),
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
