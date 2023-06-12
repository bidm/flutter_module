import 'dart:convert';

import 'package:alert/alert.dart';
// import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';
import 'weibo_post.dart';
import 'package:awesome_dialog/awesome_dialog.dart';



class WeiboNavigation extends StatefulWidget {
  const WeiboNavigation({Key? key}) : super(key: key);

  @override
  State<WeiboNavigation> createState() => _WeiboNavigationState();
}

class _WeiboNavigationState extends State<WeiboNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: DeviceConst.screenWidth(context),
      child: Stack(
        children: [
          Positioned(
              left: 12,
              bottom: 9.5,
              child: GestureDetector(
                child: const Image(image: AssetImage("assets/images/weibo/weibo_post.png"), width: 25,),
                onTap: (){
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context){
                  //       return const WeiBoPost();
                  //     },
                  //     fullscreenDialog: true
                  // ));

                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.NO_HEADER,
                    width: 380,
                    buttonsBorderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                    dismissOnTouchOutside: true,
                    dismissOnBackKeyPress: false,
                    headerAnimationLoop: true,
                    animType: AnimType.BOTTOMSLIDE,
                    title: '跳转Flutter动态页面',
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return FairWidget(
                      //           path: 'assets/bundles/lib_module_dynamic_dynamic_page1.fair.json',
                      //           data: {'fairProps': jsonEncode({'title': '动态页面', 'content': '此页面为动态生成'})}
                      //       );
                      //     }
                      // ));
                    },
                  ).show();

                },
              )
          ),
          const WeiBoNavSegment(),
          Positioned(
              right: 12,
              bottom: 7,
              child: GestureDetector(
                child: const Image(image: AssetImage("assets/images/weibo/weibo_search.png"), width: 30, color: Colors.orange,),
                onTap: (){
                  print("搜索");
                },
              )
          ),
        ],
      ),
    );
  }
}

class WeiBoNavSegment extends StatefulWidget {
  const WeiBoNavSegment({Key? key}) : super(key: key);

  @override
  State<WeiBoNavSegment> createState() => _WeiBoNavSegmentState();
}

class _WeiBoNavSegmentState extends State<WeiBoNavSegment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 40,
          child: const Text("关注", style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.w500),),
        ),
        Container(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: 40,
          child: const Text("热门", style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.w500),),
        ),
      ],
    );
  }
}
