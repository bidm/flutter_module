
import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';
import 'toutiao_recommend_model.dart';

class TouTiaoItem2 extends StatelessWidget {
  final News model;

  TouTiaoItem2({required this.model});

  final double titleFontSize = 20;
  final double authorFontSize = 13;
  final double leftPadding = 13;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 10, leftPadding, 0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: DeviceConst.screenWidth(context) - 160,
                      height: 82,
                      // color: Colors.red,
                      child: Text("${model.title}", maxLines: 3, style: TextStyle(fontSize: 20),)
                  ),
                  Row(
                    children: [
                      Container(
                        width: DeviceConst.screenWidth(context) - 24 - 130 - 20,
                          // color: Colors.green,
                          child: Text("${model.author} ${model.commentCount}评论" ,style: TextStyle(fontSize: authorFontSize, color: Colors.grey), maxLines: 1,)
                      ),


                      Container(
                          // color: Colors.red,
                          child: Image(image: AssetImage("assets/images/toutiao/toutiao_close.webp"), width: 10,)
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: Image.network(model.images[0], height: 100, width: 130, fit: BoxFit.cover,),
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