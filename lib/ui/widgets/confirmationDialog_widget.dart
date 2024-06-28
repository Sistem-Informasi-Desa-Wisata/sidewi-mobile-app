import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmationDialog({Key? key, required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 24,
                offset: Offset(0, 1),
                spreadRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0), // Set your desired padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                  child: Text(
                    'Apakah anda yakin ingin keluar?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                                width: 1.5, color: Color(0xFFF83C5B)),
                          ),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 44, vertical: 16),
                        ),
                        child: Text(
                          'Batal',
                          style: TextStyle(
                            color: Color(0xFFF83C5B),
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Add spacing between buttons
                    Expanded(
                      child: TextButton(
                        onPressed: onConfirm,
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFF83C5B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 44, vertical: 16),
                        ),
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
