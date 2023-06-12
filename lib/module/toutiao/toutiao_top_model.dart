import 'dart:convert';

TouTiaoTop touTiaoTopFromJson(String str) => TouTiaoTop.fromJson(json.decode(str));

String touTiaoTopToJson(TouTiaoTop data) => json.encode(data.toJson());

class TouTiaoTop {
  TouTiaoTop({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<TouTiaoTopNews> data;

  factory TouTiaoTop.fromJson(Map<String, dynamic> json) => TouTiaoTop(
    code: json["code"],
    message: json["message"],
    data: List<TouTiaoTopNews>.from(json["data"].map((x) => TouTiaoTopNews.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TouTiaoTopNews {
  TouTiaoTopNews({
    required this.title,
    required this.author,
    required this.commentCount,
    required this.isTop,
    required this.time,
  });

  String title;
  String author;
  int commentCount;
  bool isTop;
  String time;

  factory TouTiaoTopNews.fromJson(Map<String, dynamic> json) => TouTiaoTopNews(
    title: json["title"],
    author: json["author"],
    commentCount: json["commentCount"],
    isTop: json["isTop"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "commentCount": commentCount,
    "isTop": isTop,
    "time": time,
  };
}
