import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/views/widgets/confirmationDialog_widget.dart';
import 'package:sidewi_mobile_app/views/screens/privacyandpolicy_screen.dart';
import 'package:sidewi_mobile_app/views/screens/kelolaakun_screen.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.33,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 24,
                    offset: Offset(0, 1),
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authViewModel.user!.nama,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(authViewModel.user!.email),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: authViewModel.user!.foto != null ||
                            authViewModel.user!.foto != ''
                        ? NetworkImage(
                            '${ApiConfig.baseUrl}/resource/akun/${authViewModel.user!.foto}')
                        : AssetImage('assets/images/DefaultProfile.jpg')
                            as ImageProvider<Object>,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 24,
                    offset: Offset(0, 1),
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Kelola Akun'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KelolaAkunScreen()),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  Divider(height: 0, thickness: 1, color: Colors.grey[300]),
                  ListTile(
                    title: Text('Kebijakan Privasi'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyAndPolicyScreen()),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  Divider(height: 0, thickness: 1, color: Colors.grey[300]),
                  ListTile(
                    title: Text('Bantuan'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () async {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'pradasantika04@gmail.com',
                        query: encodeQueryParameters(
                            <String, String>{'subject': 'Bantuan'}),
                      );

                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      } else {
                        print('Could not launch $emailLaunchUri');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'No email client available or could not launch email client')),
                        );
                      }
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            SizedBox(height: 48),
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmationDialog(
                          onConfirm: () async {
                            try {
                              authViewModel.logout();
                              // Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => false);
                            } catch (e) {
                              print('Logout failed: $e');
                              // Handle logout failure
                            }
                          },
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.DangerColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Keluar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
