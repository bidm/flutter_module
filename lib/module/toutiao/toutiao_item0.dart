import 'package:flutter/material.dart';
import 'toutiao_top_model.dart';

class TouTiaoItem0 extends StatelessWidget {
  final TouTiaoTopNews model;

  TouTiaoItem0({required this.model});

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
          Row(
            children: [
              Visibility(
                visible: model.isTop,
                  child: Row(
                    children: [
                      Text("置顶", style: TextStyle(fontSize: authorFontSize, color: Colors.red),),
                      Container(
                        width: 10,
                      ),
                    ],
                  )
              ),
              Text(model.author, style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
              Container(
                width: 10,
              ),
              Text("${model.commentCount}", style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
              Container(
                width: 3,
              ),
              Text("评论", style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
            ],
          )
        ],
      ),
    );
  }
}
