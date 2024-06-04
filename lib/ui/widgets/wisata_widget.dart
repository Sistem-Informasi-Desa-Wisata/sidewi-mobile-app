import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/ui/widgets/card_item_widget.dart';

class ListWisataWidget extends StatelessWidget {
  const ListWisataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 6),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: CardItemWidget(),
            );
          }),
    );
  }
}
