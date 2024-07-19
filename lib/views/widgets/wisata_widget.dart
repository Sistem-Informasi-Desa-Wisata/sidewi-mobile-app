import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/views/screens/detail_wisata.dart';
import 'package:sidewi_mobile_app/views/widgets/caard_item_wisata_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/destinasiwisata_viewmodel.dart';
import 'package:sidewi_mobile_app/views/screens/detail_berita.dart';
import 'package:sidewi_mobile_app/views/widgets/card_item_widget.dart';

class ListWisataWidget extends StatelessWidget {
  final int id;
  final String desa;

  const ListWisataWidget({super.key, required this.id, required this.desa});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          DestinasiWisataViewModel()..fetchDestinasiWisataByIdDesa(id),
      child: Consumer<DestinasiWisataViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage.isNotEmpty) {
            return Center(child: Text('Error a: $id ${viewModel.errorMessage}'));
          }
          return SizedBox(
            child: ListView.builder(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 6),
                scrollDirection: Axis.vertical,
                itemCount: viewModel.destinasiwisataByDesaList.length,
                itemBuilder: (context, index) {
                  final destinasiwisata =
                      viewModel.destinasiwisataByDesaList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: CardItemWisataWidget(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailWisataScreen(
                                    destinasiwisata: destinasiwisata,
                                    desa: desa)));
                      },
                      destinasiwisata: destinasiwisata,
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
