import 'package:flutter/material.dart';

class FakeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Bottom Pinned Example'),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
                  childCount: 50,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 300,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Some Content Here',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Pinned Bottom Bar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
