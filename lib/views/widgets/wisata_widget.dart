import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/views/screens/detail_wisata_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/card_item_wisata_widget.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/destinasiwisata_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';

class ListWisataWidget extends StatefulWidget {
  final int id;
  final String desa;

  const ListWisataWidget({super.key, required this.id, required this.desa});

  @override
  State<ListWisataWidget> createState() => _ListWisataWidgetState();
}

class _ListWisataWidgetState extends State<ListWisataWidget> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return ChangeNotifierProvider(
      create: (context) =>
          DestinasiWisataViewModel()..fetchDestinasiWisataByIdDesa(widget.id, authViewModel.user!.id),
      child: Consumer<DestinasiWisataViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.errorMessage != null &&
              viewModel.errorMessage!.isNotEmpty) {
            return Center(
                child: Text('Error a: ${widget.id} ${viewModel.errorMessage}'));
          }

          if (viewModel.destinasiwisataByDesaList.isEmpty) {
            return Center(child: Text('No data available.'));
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
                                    desa: widget.desa)));
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
