import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';
import 'toutiao_recommend_model.dart';

class TouTiaoItem3 extends StatelessWidget {
  final News model;

  TouTiaoItem3({required this.model});
  final double titleFontSize = 20;
  final double authorFontSize = 13;
  final double leftPadding = 13;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 10, leftPadding, 0),
      child: Column(
        children: [
          Text(model.title, maxLines: 2, style: TextStyle(fontSize: 20),),
          Container(height: 10,),
          GridView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3),
            children: List.generate(model.images.length, (index){
              return Container(
                // color:  Colors.red,
                child: Image.network(model.images[index], fit: BoxFit.cover,),
              );
            }),
          ),
          Container(height: 10,),
          Stack(
            // alignment: Alignment,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: DeviceConst.screenWidth(context) - 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Container(
                          width: 10,
                        ),
                        Text(model.time, style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
                        // Text("评论评论评论评论评论评论评论评论评论评论评论评论", style: TextStyle(fontSize: authorFontSize, color: Colors.grey),),
                      ],
                    )
                  ),

                ],
              ),

              Positioned(
                right: 0,
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