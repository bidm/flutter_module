import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_module/module/toutiao/toutiao_recommend_model.dart';
import 'package:flutter_module/module/toutiao/toutiao_top_model.dart';
import 'package:flutter_module/module/weibo/weibo_model.dart';

class NetWorkManager {

  /// 微博首页
  static Future <List<Status>> getStatusListData() async {

    final jsonString = await rootBundle.loadString("assets/jsons/weibo/weibo.json");
    final result = jsonDecode(jsonString);
    final code = result["code"];
    if (code != 0) {
      return [];
    }

    final resultData = result["data"];
    List<Status> statuses = [];
    for (var json in resultData) {
      statuses.add(Status.fromJson(json));
    }
    sleep(Duration(seconds: 1));
    return statuses;
  }

  static Future <List<TouTiaoTopNews>> getTouTiaoTopListData() async {

    final jsonString = await rootBundle.loadString("assets/jsons/toutiao/toutiao.json");
    final result = jsonDecode(jsonString);
    final code = result["code"];
    if (code != 0) {
      return [];
    }

    final resultData = result["data"];
    List<TouTiaoTopNews> newsList = [];
    for (var json in resultData) {
      newsList.add(TouTiaoTopNews.fromJson(json));
    }
    sleep(Duration(seconds: 1));
    return newsList;
  }

  static Future <TouTiaoNews> getTouTiaoListData() async {

    final jsonString = await rootBundle.loadString("assets/jsons/toutiao/toutiao_recommend.json");
    final result = jsonDecode(jsonString);
    return TouTiaoNews.fromJson(result);
    // final code = result["code"];
    // if (code != 0) {
    //   return [];
    // }
    //
    // final resultData = result["data"];
    // List<TouTiaoRecommend> newsList = [];
    // for (var json in resultData) {
    //   newsList.add(TouTiaoRecommend.fromJson(json));
    // }
    // sleep(Duration(seconds: 1));
    // return newsList;
  }
}