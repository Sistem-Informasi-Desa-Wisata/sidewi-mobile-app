import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/colors.dart';

class ListCategoryWidget extends StatefulWidget {
  final ValueChanged<String> onCategorySelected;
  ListCategoryWidget({Key? key, required this.onCategorySelected});

  @override
  _ListCategoryWidgetState createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget> {
  // List item yang akan ditampilkan
  final List<String> categories = ['Rintisan', 'Berkembang', 'Maju', 'Mandiri'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 350),
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
                      widget.onCategorySelected(categories[index]);
                    });
                  },
                );
              }),
        ),
      ),
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
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? MyColors.SecondaryColor : MyColors.mainGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 24, // Mengatur tinggi tombol menjadi 24
          child: Center(
            child: Text(
              kategori,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Color(0xff010100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
