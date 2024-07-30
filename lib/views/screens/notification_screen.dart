import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/views/widgets/notification_card_widget.dart';
import 'package:sidewi_mobile_app/viewmodels/notifikasi_viewmodel.dart';
import 'package:sidewi_mobile_app/models/notifikasi_model.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      Provider.of<NotifikasiViewModel>(context, listen: false)
          .fetchAllNotifikasiById(authViewModel.user?.id)
          .then((_) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifikasiViewModel = Provider.of<NotifikasiViewModel>(context);

    if (notifikasiViewModel.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              maxHeight: 112,
              minHeight: 112,
              child: Container(
                height: 112,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            child: Text(
                              "Notifikasi",
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (notifikasiViewModel.notifikasiHariIniList.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Hari ini",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9fa5a9),
                          height: 15 / 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: NotificationList(
                          notifikasi:
                              notifikasiViewModel.notifikasiHariIniList),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                  if (notifikasiViewModel.notifikasiKemarinList.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Kemarin",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9fa5a9),
                          height: 15 / 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: NotificationList(
                          notifikasi:
                              notifikasiViewModel.notifikasiKemarinList),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                  if (notifikasiViewModel
                      .notifikasiLebihLamaList.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Lebih dari kemarin",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9fa5a9),
                          height: 15 / 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: NotificationList(
                          notifikasi:
                              notifikasiViewModel.notifikasiLebihLamaList),
                    ),
                  ],
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

class NotificationList extends StatefulWidget {
  final List<NotifikasiModel> notifikasi;
  NotificationList({required this.notifikasi});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.notifikasi.length,
      itemBuilder: (context, index) {
        final notifikasi = widget.notifikasi[index];
        return NotificationCard(notifikasi: notifikasi);
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
