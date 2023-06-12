import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';

class MeiTuanNavigation extends StatefulWidget {
  const MeiTuanNavigation({Key? key}) : super(key: key);

  @override
  State<MeiTuanNavigation> createState() => _MeiTuanNavigationState();
}

class _MeiTuanNavigationState extends State<MeiTuanNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: DeviceConst.screenWidth(context),
      child: Stack(
        children: [
          Positioned(
              left: 12,
              bottom: 6,
              child: GestureDetector(
                child: Container(
                  // color: Colors.red,
                  height: 44,
                  width: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("北京",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Container(
                        width: 5,
                      ),
                      const Image(
                        image: AssetImage(
                            "assets/images/meituan/meituan_down_arrow.webp"),
                        width: 10,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  print("定位");
                },
              )),
          Positioned(
              right: 12,
              bottom: 6,
              child: GestureDetector(
                child: Container(
                  // color: Colors.red,
                  height: 44,
                  width: 30,
                  child: const Image(
                    image: AssetImage("assets/images/meituan/meituan_add.webp"),
                    width: 30,
                  ),
                ),
                onTap: () {
                  print("发布");
                },
              )),
          Positioned(
              bottom: 8,
              left: 80,
              right: 50,
              height: 40,
              child: Container(
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      const TextField(
                        // textAlignVertica
                        // autofocus: true,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          border: InputBorder.none,
                          hintText: "吃喝玩乐上美团",
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.red,
                            width: 60,
                            // height: 44,
                            child: const Text(
                              "搜索",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      Positioned(
                          right: 60,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            color: Colors.yellow,
                            width: 1,
                            height: 30,
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
