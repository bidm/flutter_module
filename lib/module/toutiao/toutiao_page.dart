import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_module/module/toutiao/toutiao_top_model.dart';
import 'package:flutter_module/service/network_service.dart';
import 'package:flutter_module/share/device_util.dart';
import 'toutiao_item0.dart';
import 'toutiao_item1.dart';
import 'toutiao_item2.dart';
import 'toutiao_item3.dart';
import 'toutiao_item4.dart';
import 'toutiao_item5.dart';
import 'toutiao_navigation.dart';
import 'toutiao_recommend_model.dart';

class TouTiao extends StatelessWidget {
  const TouTiao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // actions区域高度大小为56
        actions: [
          TouTiaoNavigation()
        ],
        elevation: 0,
      ),
      body: TouTiaoContent(), 
    );
  }
}


class TouTiaoContent extends StatefulWidget {
  TouTiaoContent({Key? key}) : super(key: key);

  @override
  State<TouTiaoContent> createState() => _TouTiaoContentState();
}

class _TouTiaoContentState extends State<TouTiaoContent> {
  List<String> titles = ["关注","推荐","北京","抗疫","热榜","NBA","世界杯","小说","LOL","股票","经济",];

  final double titlesHeight = 40;


  List<TouTiaoTopNews> topNewsList = [];

  TouTiaoNews? news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NetWorkManager.getTouTiaoTopListData().then((value) {
      setState(() {
        topNewsList = value;
      });
    });

    NetWorkManager.getTouTiaoListData().then((value) {
      setState(() {
        news = value;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, titlesHeight + 1, 0, 0),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                      return TouTiaoItem0(model: topNewsList[index]);
                    }, childCount: topNewsList.length)
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                    return Container(
                      height: 15,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Container(
                        color: Colors.black26,
                        height: 0.3,
                      ),
                    );
                  }, childCount: 1)
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                    int showIndex = Random().nextInt(6);
                    News? _news = news?.news[showIndex];

                    if (_news == null) {
                      return Container();
                    }
                    if (showIndex == 0) {
                      return TouTiaoItem1(model: _news);
                    }
                    if (showIndex == 1) {
                      return TouTiaoItem2(model: _news);
                    }
                    if (showIndex == 2) {
                      return TouTiaoItem3(model: _news);
                    }
                    if (showIndex == 3) {
                      return TouTiaoItem4(model: _news);
                    }
                    if (showIndex == 4 ) {
                      return TouTiaoItem5(model: _news);
                    }
                    return TouTiaoItem1(model: _news);
                  }, childCount: 100)
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
            height: titlesHeight,
          width: DeviceConst.screenWidth(context),

          child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: titles.length,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: titlesHeight,
                      child: Text(titles[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    );
                  }
              ),
            ),
        ),
        Positioned(
          top: titlesHeight,
            height: 0.4,
            width: DeviceConst.screenWidth(context),
            child: Container(
              color: Color.fromRGBO(190, 190, 190, 1),
            )
        )
      ],
    );
  }
}

