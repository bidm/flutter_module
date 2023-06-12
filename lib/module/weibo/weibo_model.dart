class StatusData {
  int? code;
  String? message;
  List<Status>? data;

  StatusData({this.code, this.message, this.data});

  StatusData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Status>[];
      json['data'].forEach((v) {
        data!.add(Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? id;
  List<String>? iamges;
  User? user;
  String? content;
  String? hotTagImage;
  String? hotTagContent;
  int? commentCount;
  int? likeCount;
  bool? liked;
  int? shareCount;

  Status(
      {this.id,
        this.iamges,
        this.user,
        this.content,
        this.hotTagImage,
        this.hotTagContent,
        this.commentCount,
        this.likeCount,
        this.liked,
        this.shareCount});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iamges = json['iamges'].cast<String>();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    content = json['content'];
    hotTagImage = json['hotTagImage'];
    hotTagContent = json['hotTagContent'];
    commentCount = json['commentCount'];
    likeCount = json['saveCount'];
    liked = json['liked'];
    shareCount = json['shareCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['iamges'] = iamges;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['content'] = content;
    data['hotTagImage'] = hotTagImage;
    data['hotTagContent'] = hotTagContent;
    data['commentCount'] = commentCount;
    data['saveCount'] = likeCount;
    data['liked'] = liked;
    data['shareCount'] = shareCount;
    return data;
  }
}

class User {
  String? name;
  bool? isDaV;
  bool? isVip;
  int? vipLevel;
  String? vipIcon;
  String? desc;
  bool? isAttention;
  String? device;

  User(
      {this.name,
        this.isDaV,
        this.isVip,
        this.vipLevel,
        this.vipIcon,
        this.desc,
        this.isAttention,
        this.device});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isDaV = json['isDaV'];
    isVip = json['isVip'];
    vipLevel = json['vipLevel'];
    vipIcon = json['vipIcon'];
    desc = json['desc'];
    isAttention = json['isAttention'];
    device = json['device'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['isDaV'] = isDaV;
    data['isVip'] = isVip;
    data['vipLevel'] = vipLevel;
    data['vipIcon'] = vipIcon;
    data['desc'] = desc;
    data['isAttention'] = isAttention;
    data['device'] = device;
    return data;
  }
}