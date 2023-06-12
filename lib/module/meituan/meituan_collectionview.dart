import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MeiTuanCollectionView extends StatelessWidget {
  const MeiTuanCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        title: Text("测试自定义布局"),
      ),
      body: const MeiTuanCollectionViewContent(),
    );
  }
}


class MeiTuanCollectionViewContent extends StatelessWidget {
  const MeiTuanCollectionViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          height: Random().nextInt(10) * 20,
          color: Colors.red,
          child: Text("$index"),
        );
      },
    );
  }
}
