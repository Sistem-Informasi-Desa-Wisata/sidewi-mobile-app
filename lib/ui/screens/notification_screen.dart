import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/ui/widgets/notificationCard_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12), // Using SizedBox for margin
              Container(
                decoration: BoxDecoration(
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
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      'Hari ini',
                      style: TextStyle(
                        color: Color(0xFF9FA5A9),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12), // Adjust spacing as needed
                    NotificationCard(
                      context,
                      147,
                      "Desa Jatiluwih memposting berita baru",
                      "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                    ),
                    NotificationCard(
                      context,
                      147,
                      "Desa Jatiluwih memposting berita baru",
                      "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
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
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      'Kemarin',
                      style: TextStyle(
                        color: Color(0xFF9FA5A9),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12), // Adjust spacing as needed
                    NotificationCard(
                      context,
                      147,
                      "Desa Jatiluwih memposting berita baru",
                      "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                    ),
                    NotificationCard(
                      context,
                      147,
                      "Desa Jatiluwih memposting berita baru",
                      "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
