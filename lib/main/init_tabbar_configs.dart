import 'package:flutter/material.dart';
import 'package:flutter_module/module/meituan/meituan_collectionview.dart';
import 'package:flutter_module/module/meituan/meituan_page.dart';
import 'package:flutter_module/module/tabbar/tabbar_item.dart';
import 'package:flutter_module/module/toutiao/toutiao_page.dart';
import 'package:flutter_module/module/weibo/weibo_page.dart';

import '../module/custom/custom_page.dart';

class InitTabBarConfig {

  /*
   com.bidm.FlutterDemo
   */


  static double iconWidth = 25.0;

  static List<BottomNavigationBarItem> items = [
    TabbarItem(Image(image: const AssetImage("assets/images/weibo/weibo.png"), width: iconWidth, height: iconWidth,), "微博"),
    TabbarItem(Image(image: const AssetImage("assets/images/meituan/meituan.png"), width: iconWidth, height: iconWidth,), "美团"),
    TabbarItem(Image(image: const AssetImage("assets/images/toutiao/toutiao.png"), width: iconWidth, height: iconWidth,), "头条"),
    // TabbarItem(Image(image: const AssetImage("assets/images/toutiao/toutiao.png"), width: iconWidth, height: iconWidth,), "自定义")
  ];

  static List<Widget> pages = [
    const WeiBo(),
    const MeiTuan(),
    // const MeiTuanCollectionView()
    const TouTiao(),
    // const CustomPage()
  ];
}