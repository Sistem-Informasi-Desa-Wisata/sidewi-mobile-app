import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/widgets/berita_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/detail_desa_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/produk_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/wisata_widget.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/informasidesawisata_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DesaWisataViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DesaWisataViewModel();
    _viewModel.fetchDetailDesaWisata(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DesaWisataViewModel>.value(
      value: _viewModel,
      child: Scaffold(
        body: Stack(
          children: [
            Consumer<DesaWisataViewModel>(
              builder: (context, viewModel, child) {
                print(
                    "data desaWisataDetail (view): ${viewModel.desaWisataDetail}");
                print(
                    "data informasiDesaWisata (view): ${viewModel.informasiDesaWisata}");
                if (viewModel == null || viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.errorMessage != null) {
                  return Center(child: Text(viewModel.errorMessage!));
                }

                final detail = viewModel.desaWisataDetail;
                if (detail == null) {
                  return const Center(child: Text('No data available'));
                }

                return BackgroundDetail(detail: detail);
              },
            ),
            SingleChildScrollView(
              child: Container(
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/ic_back_white.svg')),
                            IconButton(
                                onPressed: null,
                                icon: SvgPicture.asset(
                                    'assets/icons/ic_share.svg'))
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
                      height: 800,
                      child: const DetailPage(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

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
    return Consumer<DesaWisataViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.errorMessage != null) {
          return Center(child: Text(viewModel.errorMessage!));
        }

        final detail = viewModel.desaWisataDetail;
        final informasi = viewModel.informasiDesaWisata;

        return detail == null
            ? const Center(child: Text('No data available'))
            : Container(
                child: Column(
                  children: [
                    // Heading tab pagination section
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
                        padding:
                            const EdgeInsets.only(left: 24, right: 24, top: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 300,
                                      child: Text(
                                        detail.nama,
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff000000),
                                          height: 29 / 24,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      detail.kabupaten,
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                        height: 15 / 12,
                                      ),
                                    )
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
                                                'assets/icons/ic_bottom_love_nonactive.svg')),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            // Tab Bar Section
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Container(
                                height: 25,
                                child: TabBar(
                                  indicatorColor: Colors.black,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorWeight: 0.1,
                                  dividerColor: Colors.white,
                                  indicatorPadding:
                                      const EdgeInsets.symmetric(vertical: 0.1),
                                  controller: _tabController,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: const [
                                    Tab(
                                      text: 'Detail',
                                    ),
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
                          DetailTab(
                            detail: detail,
                            informasi: informasi!,
                          ),
                          BeritaTab(id: detail.id, desa: detail.nama),
                          WisataTab(id: detail.id, desa: detail.nama),
                          ProdukTab(id: detail.id),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class DetailTab extends StatefulWidget {
  final DesaWisataModel detail;
  final InformasiDesaWisataModel informasi;
  const DetailTab({super.key, required this.detail, required this.informasi});

  @override
  State<DetailTab> createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  @override
  Widget build(BuildContext context) {
    return DetailDesaWidget(
      detail: widget.detail,
      informasi: widget.informasi,
    );
  }
}

class BeritaTab extends StatefulWidget {
  final int id;
  final String desa;
  const BeritaTab({super.key, required this.id, required this.desa});

  @override
  State<BeritaTab> createState() => _BeritaTabState();
}

class _BeritaTabState extends State<BeritaTab> {
  @override
  Widget build(BuildContext context) {
    return ListBeritaWidget(id: widget.id, desa: widget.desa);
  }
}

class WisataTab extends StatefulWidget {
  final int id;
  final String desa;
  const WisataTab({super.key, required this.id, required this.desa});

  @override
  State<WisataTab> createState() => _WisataTabState();
}

class _WisataTabState extends State<WisataTab> {
  @override
  Widget build(BuildContext context) {
    return ListWisataWidget(id: widget.id, desa: widget.desa);
  }
}

class ProdukTab extends StatefulWidget {
  final int id;
  const ProdukTab({super.key, required this.id});

  @override
  State<ProdukTab> createState() => _ProdukTabState();
}

class _ProdukTabState extends State<ProdukTab> {
  @override
  Widget build(BuildContext context) {
    return ListProdukWidget(id: widget.id);
  }
}

class BackgroundDetail extends StatefulWidget {
  final DesaWisataModel detail;
  const BackgroundDetail({super.key, required this.detail});

  @override
  State<BackgroundDetail> createState() => _BackgroundDetailState();
}

class _BackgroundDetailState extends State<BackgroundDetail> {
  @override
  Widget build(BuildContext context) {
    // Determine if the image URL is valid or not
    final imageProvider = (widget.detail.gambar != null &&
            widget.detail.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/desawisata/${widget.detail.gambar}')
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
