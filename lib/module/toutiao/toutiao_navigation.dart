

import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';

class TouTiaoNavigation extends StatelessWidget {
  const TouTiaoNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConst.screenWidth(context),
      color: Colors.red,
      child: Stack(
        children: [
          Positioned (
              bottom: 8,
              left: 20,
              right: 60,
              height: 40,

              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),

                child: const TextField(
                  // autofocus: true,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(35, 0, 10, 9),
                    border: InputBorder.none,
                    hintText: "佩洛西访台是危险行为 | NBA总冠军"
                  ),
                ),
              )
          ),
          Positioned(
            right: 10,
              width: 40,
              top: 6,
              child: GestureDetector(
                child: Container(
                  child: Column(
                    children: [
                      const Image(image: AssetImage("assets/images/meituan/meituan_add.webp"), width: 25, color: Colors.white,),
                      Container(
                        height: 1,
                      ),
                      const Text("发布", style: TextStyle(fontSize: 13, color: Colors.white),)
                    ],
                  ),
                ),
                onTap: (){
                  print("点击了发布按钮");
                },
              )
          ),
          const Positioned(
            left: 30,
              top: 17,
              child: Image(image: AssetImage("assets/images/weibo/weibo_search.png"), width: 25, color: Colors.black87,)
          )
        ],
      ),
    );
  }
}
