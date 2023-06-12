import 'dart:convert';

TouTiaoNews touTiaoNewsFromJson(String str) => TouTiaoNews.fromJson(json.decode(str));

String touTiaoNewsToJson(TouTiaoNews data) => json.encode(data.toJson());

class TouTiaoNews {
  TouTiaoNews({
    required this.news,
  });

  List<News> news;

  factory TouTiaoNews.fromJson(Map<String, dynamic> json) => TouTiaoNews(
    news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "news": List<dynamic>.from(news.map((x) => x.toJson())),
  };
}

class News {
  News({
    required this.type,
    required this.title,
    required this.author,
    required this.commentCount,
    required this.time,
    required this.isAd,
    required this.images,
  });

  int type;
  String title;
  String author;
  int commentCount;
  String time;
  bool isAd;
  List<String> images;

  factory News.fromJson(Map<String, dynamic> json) => News(
    type: json["type"],
    title: json["title"],
    author: json["author"],
    commentCount: json["commentCount"],
    time: json["time"],
    isAd: json["isAd"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "author": author,
    "commentCount": commentCount,
    "time": time,
    "isAd": isAd,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
