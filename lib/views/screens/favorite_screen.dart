import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/views/screens/detail_screen.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/destinasiwisata_viewmodel.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailPage());
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
    _tabController = TabController(length: 2, vsync: this);
    Provider.of<DesaWisataViewModel>(context, listen: false).fetchDesaWisata();
    Provider.of<DestinasiWisataViewModel>(context, listen: false)
        .fetchDestinasiWisataList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Heading tab pagination section
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 1),
                  blurRadius: 24,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Disukai",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 20 / 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
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
                        indicatorPadding: EdgeInsets.symmetric(vertical: 0.1),
                        labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: 'Desa',
                          ),
                          Tab(text: 'Wisata'),
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
                Desa(),
                Wisata(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Desa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var desaWisataList =
        Provider.of<DesaWisataViewModel>(context).desaWisataList;
    return ListWidget<DesaWisataModel>(items: desaWisataList);
  }
}

class Wisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var destinasiWisataList =
        Provider.of<DestinasiWisataViewModel>(context).destinasiwisataList;
    return ListWidget<DestinasiWisataModel>(items: destinasiWisataList);
  }
}

class ListWidget<T> extends StatelessWidget {
  final List<T> items;
  const ListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.90,
      ),
      itemBuilder: (context, index) {
        return ItemWidget<T>(item: items[index]);
      },
    );
  }
}

class ItemWidget<T> extends StatefulWidget {
  final T item;

  ItemWidget({required this.item});

  @override
  State<ItemWidget> createState() => _ItemWidgetState<T>();
}

class _ItemWidgetState<T> extends State<ItemWidget<T>> {
  bool _isFavorite = false;
  String? _kategoriNama;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.item is DestinasiWisataModel) {
      fetchCategoryName();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> fetchCategoryName() async {
    final viewModel =
        Provider.of<DestinasiWisataViewModel>(context, listen: false);
    String? name = await viewModel.getCategoryName(
        (widget.item as DestinasiWisataModel).id_kategoridestinasi);
    setState(() {
      _kategoriNama = name;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imageName;
    String title;
    String location;
    int id;

    if (widget.item is DesaWisataModel) {
      var desaWisata = widget.item as DesaWisataModel;
      imageName = (desaWisata.gambar != null && desaWisata.gambar.isNotEmpty)
          ? '${ApiConfig.baseUrl}/resource/desawisata/${desaWisata.gambar}'
          : 'assets/images/DefaultImage.jpg';
      title = desaWisata.nama;
      location = desaWisata.alamat;
      id = desaWisata.id;
    } else if (widget.item is DestinasiWisataModel) {
      var destinasiWisata = widget.item as DestinasiWisataModel;
      imageName = (destinasiWisata.gambar != null &&
              destinasiWisata.gambar.isNotEmpty)
          ? '${ApiConfig.baseUrl}/resource/destinasiwisata/${destinasiWisata.gambar}'
          : 'assets/images/DefaultImage.jpg';
      title = destinasiWisata
          .nama; // Ensure title is also set for DestinasiWisataModel
      location = _isLoading ? 'Loading...' : (_kategoriNama ?? 'Unknown');
      id = destinasiWisata.id;
    } else {
      throw Exception('Unsupported model type');
    }

    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(id: id),
            ),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 160,
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
                  padding: const EdgeInsets.only(
                      top: 12, left: 8, right: 8, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        DetailScreen(id: id),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 80,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            width: 24,
                            height: 24,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              child: _isFavorite
                                  ? SvgPicture.asset(
                                      'assets/icons/ic_favorite_active.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/ic_favorite_nonactive.svg'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 15 / 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 10 / 8,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
