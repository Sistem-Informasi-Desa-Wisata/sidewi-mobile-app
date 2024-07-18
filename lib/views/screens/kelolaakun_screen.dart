import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/user_viewmodel.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
 
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
      if (authViewModel.user != null) {
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
        throw Exception('User data is null');
      }
    } catch (e) {
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
      appBar: AppBar(
        title: Text('Kelola Akun'),
      ),
      body: Padding(
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
                            : AssetImage('assets/images/default_avatar.png')
                                as ImageProvider,
                    child: _imageFile == null ? Icon(Icons.camera_alt) : null,
                  ),
                ),
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _noHpController,
                  decoration: InputDecoration(labelText: 'No HP'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'password'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _updateUser,
                  child: Text('Update'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
