import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // untuk search
            child: Container(
              // width: 268,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MyColors.mainGrey,
                  hintText: 'Telusuri...',
                  hintStyle: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: MyColors.textGrey,
                    height: 12 / 12,
                  ),
                  border: OutlineInputBorder(
                    // Menggunakan OutlineInputBorder
                    borderRadius: BorderRadius.circular(
                        8.0), // Menetapkan border radius di sini
                    borderSide: BorderSide.none, // Tidak ada border tepi
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  suffixIcon: IconButton(
                    icon: Transform.scale(
                      scale: 1.5,
                      child: SvgPicture.asset(
                        'assets/icons/ic_search.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    onPressed: () {
                      // Lakukan sesuatu ketika tombol pencarian ditekan
                      print('Search button pressed');
                    },
                  ),
                ),
                onChanged: (value) {
                  // Update search query ketika teks berubah
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 32,
            height: 32,
            color: MyColors.mainGrey,
            child: IconButton(
              icon: Transform.scale(
                  scale: 1.5,
                  child: SvgPicture.asset('assets/icons/ic_candle.svg')),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
