import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/informasidesawisata_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:sidewi_mobile_app/views/widgets/berita_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/detail_desa_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/produk_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/wisata_widget.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DesaWisataViewModel()..fetchDetailDesaWisata(id),
        child: Scaffold(
          body: Consumer<DesaWisataViewModel>(
            builder: (context, viewModel, child) {
              print("data desaWisataDetail (view): ${viewModel.desaWisataDetail}");
              print("data informasiDesaWisata (view): ${viewModel.informasiDesaWisata}");
              if (viewModel.desaWisataDetail == null ||
                  viewModel.informasiDesaWisata == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Stack(
                children: [
                  BackgroundDetail(detail: viewModel.desaWisataDetail!),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 376,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 60, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: SvgPicture.asset(
                                      'assets/icons/ic_back_white.svg'),
                                ),
                                IconButton(
                                  onPressed: null,
                                  icon: SvgPicture.asset(
                                      'assets/icons/ic_share.svg'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: DetailPage(
                            detail: viewModel.desaWisataDetail!,
                            informasi: viewModel.informasiDesaWisata!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

class DetailPage extends StatefulWidget {
  final DesaWisataModel detail;
  final InformasiDesaWisataModel informasi;

  const DetailPage({Key? key, required this.detail, required this.informasi})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorite = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                offset: Offset(0, 1),
                blurRadius: 24,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.detail.nama,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            height: 29 / 24,
                          ),
                        ),
                        Text(
                          widget.detail.kabupaten,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            height: 15 / 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                          child: _isFavorite
                              ? SvgPicture.asset(
                                  'assets/icons/ic_full_love.svg')
                              : SvgPicture.asset(
                                  'assets/icons/ic_bottom_love_nonactive.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Tab Bar Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Container(
                    height: 25,
                    child: TabBar(
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 2.0, // Adjusted for better visibility
                      dividerColor: Colors.white,
                      indicatorPadding:
                          const EdgeInsets.symmetric(vertical: 0.1),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: 'Detail'),
                        Tab(text: 'Berita'),
                        Tab(text: 'Wisata'),
                        Tab(text: 'Produk'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Tab Bar View Section
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              DetailTab(detail: widget.detail, informasi: widget.informasi),
              BeritaTab(id: widget.detail.id, desa: widget.detail.nama),
              WisataTab(id: widget.detail.id, desa: widget.detail.nama),
              ProdukTab(),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailTab extends StatelessWidget {
  final DesaWisataModel detail;
  final InformasiDesaWisataModel informasi;

  const DetailTab({Key? key, required this.detail, required this.informasi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailDesaWidget(detail: detail, informasi: informasi);
  }
}

class BeritaTab extends StatelessWidget {
  final int id;
  final String desa;

  const BeritaTab({Key? key, required this.id, required this.desa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBeritaWidget(id: id, desa: desa);
  }
}

class WisataTab extends StatelessWidget {
  final int id;
  final String desa;

  const WisataTab({Key? key, required this.id, required this.desa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWisataWidget(id: id, desa: desa);
  }
}

class ProdukTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListProdukWidget();
  }
}

class BackgroundDetail extends StatelessWidget {
  final DesaWisataModel detail;

  const BackgroundDetail({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = (detail.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/desawisata/${detail.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;

    return Container(
      alignment: Alignment.topLeft,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
