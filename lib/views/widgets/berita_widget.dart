import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/berita_viewmodel.dart';
import 'package:sidewi_mobile_app/views/screens/detail_berita_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/card_item_berita_widget.dart';

class ListBeritaWidget extends StatelessWidget {
  final int id;
  final String desa;

  const ListBeritaWidget({super.key, required this.id, required this.desa});

  @override
  Widget build(BuildContext context) {
    // Provide the BeritaViewModel
    return ChangeNotifierProvider(
      create: (context) => BeritaViewModel()..fetchBeritaByIdDesa(id),
      child: Consumer<BeritaViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.beritaByDesaList.isEmpty) {
            return Center(child: Text('Data not found'));
          }

          return SizedBox(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 6),
              scrollDirection: Axis.vertical,
              itemCount: viewModel.beritaByDesaList.length,
              itemBuilder: (context, index) {
                final berita = viewModel.beritaByDesaList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: CardItemBeritaWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailBeritaScreen(berita: berita, desa: desa),
                        ),
                      );
                    },
                    berita: berita,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
