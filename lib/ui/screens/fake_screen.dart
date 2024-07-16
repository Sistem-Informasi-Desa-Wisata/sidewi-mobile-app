import 'package:flutter/material.dart';

import 'package:sidewi_mobile_app/ui/widgets/destinasi_widget.dart';

class FakeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Bottom Pinned Example'),
      ),
      body: DestinasiWidgetListHorizontal(),
    );
  }
}
