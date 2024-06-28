import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProdukWidget extends StatelessWidget {
  const ListProdukWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 0),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return ProdukItemWidget();
        },
      ),
    );
  }
}

class ProdukItemWidget extends StatelessWidget {
  const ProdukItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/images/foto_berita.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Color(0XFF00000000).withOpacity(0),
                  Color(0XFF00000000).withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    child: Text(
                      "Festival Budaya Sangeh",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 50,
                    child: Text(
                      "25 Mei 2024",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 10 / 8,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
