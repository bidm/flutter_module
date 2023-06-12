import 'package:flutter/material.dart';
import 'meituan_item4.dart';
import 'meituan_navigation.dart';
import 'meituan_item.dart';
import 'meituan_item2.dart';
import 'meituan_item3.dart';

class MeiTuan extends StatelessWidget {
  const MeiTuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        actions: const [
          MeiTuanNavigation(),
        ],
      ),
      body: const MeiTuanContent(),
    );
  }
}

class MeiTuanContent extends StatelessWidget {
  const MeiTuanContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == 0) {
            return MeiTuanTopItem();
          }
          if (index == 1) {
            return const MeiTuanItem2();
          }
          if (index == 2) {
            return const MeiTuanItem3();
          }
          return Container();
        }, childCount: 4)),
        SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              double leftMargin = 5;
              double rightMargin = 10;
              if (index % 2 == 0) {
                leftMargin = 10;
                rightMargin = 5;
              }

              return Container(
                color: const Color.fromRGBO(241, 241, 241, 1),
                padding: EdgeInsets.fromLTRB(leftMargin, 0, rightMargin, 10),
                child: GestureDetector(
                    child: MeiTuanItem4(""),
                  onTap: (){
                  },
                ),
              );
            }, childCount: 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.6)
        ),
      ],
    );
  }
}
