import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/services/api_service.dart';
import 'package:sidewi_mobile_app/ui/widgets/confirmationDialog_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
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
                        'Pandu Anggi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('panduanggi0899@gmail.com'),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
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
                      // Navigate to Manage Account screen
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  Divider(height: 0, thickness: 1, color: Colors.grey[300]),
                  ListTile(
                    title: Text('Kebijakan Privasi'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigate to Privacy Policy screen
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  Divider(height: 0, thickness: 1, color: Colors.grey[300]),
                  ListTile(
                    title: Text('Bantuan'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigate to Help screen
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
                              await ApiService().logout();
                              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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
