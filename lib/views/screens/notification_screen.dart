import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/widgets/notification_card_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text(
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
                  Container(
                    child: NotificationList(),
                  ),
                  Text(
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
                  Container(
                    child: NotificationList(),
                  )
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2, // Mengatur jumlah item menjadi 2
      itemBuilder: (context, index) {
        return NotificationCard();
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
