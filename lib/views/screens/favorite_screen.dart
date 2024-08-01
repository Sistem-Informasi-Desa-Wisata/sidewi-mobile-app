import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/destinasiwisata_viewmodel.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/views/screens/detail_desa_screen.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:sidewi_mobile_app/views/screens/detail_wisata_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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

  @override
  void initState() {
    super.initState();
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _tabController = TabController(length: 2, vsync: this);
    // Fetch data here
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DesaWisataViewModel>(context, listen: false)
          .fetchDesaFavoritUser(authViewModel.user!.id);
      Provider.of<DestinasiWisataViewModel>(context, listen: false)
          .fetchDestinasiFavoritUser(authViewModel.user!.id);
    });
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
                Desa(tab: "desa"),
                Wisata(tab: "destinasi"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Desa extends StatefulWidget {
  final String tab;
  const Desa({required this.tab});
  @override
  State<Desa> createState() => _DesaState();
}

class _DesaState extends State<Desa> {
  @override
  Widget build(BuildContext context) {
    var favoritDesaList =
        Provider.of<DesaWisataViewModel>(context).favoritDesaList;
    return ListWidget<DesaWisataModel>(
      items: favoritDesaList,
      tab: widget.tab,
    );
  }
}

class Wisata extends StatefulWidget {
  final String tab;
  const Wisata({required this.tab});
  @override
  State<Wisata> createState() => _WisataState();
}

class _WisataState extends State<Wisata> {
  @override
  Widget build(BuildContext context) {
    var favoritDestinasiWisataList =
        Provider.of<DestinasiWisataViewModel>(context).favoritDestinasiList;
    return ListWidget<DestinasiWisataModel>(
        items: favoritDestinasiWisataList, tab: widget.tab);
  }
}

class ListWidget<T> extends StatelessWidget {
  final List<T> items;
  final String tab;
  const ListWidget({super.key, required this.items, required this.tab});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      if (tab == "desa") {
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
              Text("Tidak ada desa favorit"),
            ],
          ),
        ));
      } else {
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
              Text("Tidak ada destinasi favorit"),
            ],
          ),
        ));
      }
    }
    return GridView.builder(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      itemCount: items.length, // Use items.length here
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.90,
      ),
      itemBuilder: (context, index) {
        return ItemWidget<T>(
          item: items[index],
          tab: tab,
        );
      },
    );
  }
}

class ItemWidget<T> extends StatefulWidget {
  final T item;
  final String tab;

  ItemWidget({required this.item, required this.tab});

  @override
  State<ItemWidget> createState() => _ItemWidgetState<T>();
}

class _ItemWidgetState<T> extends State<ItemWidget<T>> {
  String? _kategoriNama;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<DesaWisataViewModel>(context, listen: false);
    if (widget.item is DestinasiWisataModel) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await fetchCategoryName();
      });
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
    if (mounted) {
      setState(() {
        _kategoriNama = name;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String itemName;
    String itemDesc;
    int itemId;
    bool isFavorite;
    ImageProvider imageProvider;

    if (widget.tab == "desa") {
      var item = widget.item as DesaWisataModel;
      itemName = item.nama;
      itemDesc = item.alamat;
      itemId = item.id;
      isFavorite = item.isFavorite;

      imageProvider = (item.gambar.isNotEmpty)
          ? NetworkImage(
              '${ApiConfig.baseUrl}/resource/desawisata/${item.gambar}')
          : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    } else {
      var item = widget.item as DestinasiWisataModel;
      itemName = item.nama;
      itemDesc = _kategoriNama!;
      itemId = item.id;
      isFavorite = item.isFavorite;

      imageProvider = (item.gambar.isNotEmpty)
          ? NetworkImage(
              '${ApiConfig.baseUrl}/resource/destinasiwisata/${item.gambar}')
          : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    }

    final desaWisataViewModel = Provider.of<DesaWisataViewModel>(context);
    final destinasiWisataViewModel =
        Provider.of<DestinasiWisataViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration:
                    Duration(milliseconds: 500), // Transition duration
                pageBuilder: (context, animation, secondaryAnimation) {
                  if (widget.tab == "desa") {
                    return DetailScreen(id: itemId);
                  } else {
                    var item = widget.item as DestinasiWisataModel;
                    return DetailWisataScreen(
                        destinasiwisata: item, desa: itemName);
                  }
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var fadeAnimation =
                      Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.ease,
                  ));
                  return FadeTransition(opacity: fadeAnimation, child: child);
                },
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
                      image: imageProvider,
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
                                  if (widget.tab == "desa") {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            DetailScreen(
                                          id: itemId,
                                        ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          var fadeAnimation =
                                              Tween(begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.ease,
                                          ));
                                          return FadeTransition(
                                              opacity: fadeAnimation,
                                              child: child);
                                        },
                                      ),
                                    );
                                  } else {
                                    var item =
                                        widget.item as DestinasiWisataModel;
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            DetailWisataScreen(
                                                destinasiwisata: item,
                                                desa: itemName),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          var fadeAnimation =
                                              Tween(begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.ease,
                                          ));
                                          return FadeTransition(
                                              opacity: fadeAnimation,
                                              child: child);
                                        },
                                      ),
                                    );
                                  }
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
                                  if (widget.tab == "desa") {
                                    desaWisataViewModel.toggleFavoriteStatus(
                                        widget.item as DesaWisataModel,
                                        authViewModel.user!.id);
                                  } else {
                                    destinasiWisataViewModel
                                        .toggleFavoriteStatus(
                                            widget.item as DestinasiWisataModel,
                                            authViewModel.user!.id);
                                  }
                                },
                                child: isFavorite
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
                              itemName,
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
                              itemDesc,
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                height: 10 / 8,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
