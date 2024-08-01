import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/models/produk_model.dart';
import 'package:sidewi_mobile_app/viewmodels/produk_viewmodel.dart';
import 'package:sidewi_mobile_app/views/screens/detail_produk_screen.dart';
import 'package:sidewi_mobile_app/views/screens/review_screen.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:intl/intl.dart';

class ListProdukWidget extends StatefulWidget {
  final int id;
  const ListProdukWidget({super.key, required this.id});

  @override
  State<ListProdukWidget> createState() => _ListProdukWidgetState();
}

class _ListProdukWidgetState extends State<ListProdukWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProdukViewModel()..fetchProdukByIdDesa(widget.id),
      child: Consumer<ProdukViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.produkByDesaList.isEmpty) {
            return Center(
                child: Container(
              width: 180,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_empty.svg',
                    height: 128, // Set the height of the picture to 16
                  ),
                  SizedBox(height: 16),
                  // Add some spacing between the SVG and the text
                  Text("Tidak ada produk"),
                ],
              ),
            ));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: viewModel.produkByDesaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final produk = viewModel.produkByDesaList[index];
                return ProdukItemWidget(produk: produk);
              },
            ),
          );
        },
      ),
    );
  }
}

String formatRupiah(int number) {
  final formatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return formatCurrency.format(number);
}

class ProdukItemWidget extends StatefulWidget {
  final ProdukModel produk;
  const ProdukItemWidget({super.key, required this.produk});

  @override
  State<ProdukItemWidget> createState() => _ProdukItemWidgetState();
}

class _ProdukItemWidgetState extends State<ProdukItemWidget> {
  @override
  Widget build(BuildContext context) {
    final imageProvider = (widget.produk.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/produk/${widget.produk.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailProdukScreen(produk: widget.produk)));
        },
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: imageProvider,
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
                        widget.produk.nama,
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
                        formatRupiah(widget.produk.harga),
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
      ),
    );
  }
}
