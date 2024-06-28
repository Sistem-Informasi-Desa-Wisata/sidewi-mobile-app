import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/ui/widgets/notificationCard_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: ListView(
            children: [
              const SizedBox(height: 12),
              _buildNotificationSection(
                context: context,
                title: 'Hari ini',
                notifications: [
                  "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                  "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                ],
              ),
              const SizedBox(height: 12),
              _buildNotificationSection(
                context: context,
                title: 'Kemarin',
                notifications: [
                  "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                  "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSection({required BuildContext context, required String title, required List<String> notifications}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
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
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF9FA5A9),
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          ...notifications.map((notification) => NotificationCard(
            context, // Pass context here if needed
            147,
            notification,
          )),
        ],
      ),
    );
  }
}
