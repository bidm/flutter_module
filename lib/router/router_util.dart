import 'package:flutter/material.dart';
import 'package:flutter_module/module/tabbar/tabbar_content.dart';
import 'package:flutter_module/module/weibo/weibo_post.dart';

class RoutersUtil {

  static String initRoute = TabbarContentPage.routeName;

  static Map<String, WidgetBuilder> routers = {
    WeiBoPost.routeName: (ctx) => WeiBoPost(),
    TabbarContentPage.routeName: (ctx) => TabbarContentPage()
  };
}
