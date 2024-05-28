import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/colors.dart';

class ListCategoryWidget extends StatefulWidget {
  ListCategoryWidget({Key? key});

  @override
  _ListCategoryWidgetState createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget> {
  // List item yang akan ditampilkan
  final List<String> categories = ['Rintisan', 'Berkembang', 'Maju', 'Mandiri'];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoriesItem(
              kategori: categories[index],
              isSelected: index == selectedIndex,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          }),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key,
      required this.kategori,
      required this.isSelected,
      required this.onTap});

  final String kategori;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                isSelected ? MyColors.SecondaryColor : MyColors.mainGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(0, 24), // Mengatur tinggi tombol menjadi 24
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero, // Mengatur padding menjadi nol
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 10),
            child: Text(
              kategori,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Color(0xff010100),
              ),
            ),
          )),
    );
  }
}
