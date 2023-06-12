import 'package:flutter/material.dart';
import 'package:flutter_module/module/toutiao/toutiao_recommend_model.dart';

class TouTiaoItem1 extends StatelessWidget {
  final News model;

  TouTiaoItem1({required this.model});

  final double titleFontSize = 20;
  final double authorFontSize = 13;
  final double leftPadding = 13;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 0, leftPadding, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
          ),
          Text(model.title, style: TextStyle(fontSize: titleFontSize, color: Colors.black),),
          Container(
            height: 2,
          ),
          Stack(
            children: [
              Row(
                children: [
                  Text(model.author, style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
                  Container(
                    width: 10,
                  ),
                  Text("${model.commentCount}", style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
                  Container(
                    width: 3,
                  ),
                  Text("评论", style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
                  // Text("评论评论评论评论评论评论评论评论评论评论评论评论", style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
                ],
              ),
              Positioned(
                height: 20,
                  width: 20,
                  bottom: 0,
                  right: 5,
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.red,
                    child: Image(image: AssetImage("assets/images/toutiao/toutiao_close.webp"), width: 10,)
                  )
              )
            ],
          ),
          Container(
            height: 10,
            padding: EdgeInsets.fromLTRB(0, 9.7, 0, 0),
            child: Container(
              color: Colors.black26,
              height: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
