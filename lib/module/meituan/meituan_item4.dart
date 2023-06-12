import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';

class MeiTuanItem4 extends StatefulWidget {
  final String iconImage1;


  MeiTuanItem4(this.iconImage1, {Key? key}) : super(key: key);

  @override
  State<MeiTuanItem4> createState() => _MeiTuanItem4State();
}

class _MeiTuanItem4State extends State<MeiTuanItem4> {

  int randomInt = Random().nextInt(16) + 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildTopImage(context),
        Container(height: 5,),
        buildTitle(),
        Container(height: 5,),
        buildPrice(),
        Container(height: 5,),
        buildLocation()
      ]),
    );
  }

  Widget buildTopImage(BuildContext context) {
    final double itemW = (DeviceConst.screenWidth(context) - 30) / 2.0;
    String iconImage = "assets/images/meituan/meituan_pijiu$randomInt.jpeg";
    return Stack(
      children: [
        Container(
          height: itemW,
          width: itemW,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image(
            image: AssetImage(iconImage),
            fit: BoxFit.cover,
          ),
        ),
        buildPeiSong()
      ],
    );
  }

  Widget buildPeiSong() {
    return Positioned(
        bottom: 0,
        left: 0,
        height: 30,
        width: 175,
        child: Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                // width: 70,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(
                          "assets/images/meituan/meituan_peisong.webp"),
                      height: 30,
                    ),
                    Positioned(
                        top: 3,
                        left: 8,
                        child: Text(
                          "配送上门",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Container(
                width: 3,
              ),
              Text(
                "最快30分钟",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.35),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
        ));
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text.rich(TextSpan(children: [
        WidgetSpan(
            child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.red
              ),
              child: Image(
                image: AssetImage("assets/images/meituan/meituan_ziying.webp"),
                height: 20,
              ),
            ),
            Positioned(
              left: 4,
                top: 0,
                child: Text(
                  "自营",
                  style: TextStyle(fontSize: 14, color: Colors.brown),
                )
            )
          ],
        )),
        TextSpan(text: " ", style: TextStyle(fontSize: 19)),
        TextSpan(text: "夏天还是要多喝点啤酒。。", style: TextStyle(fontSize: 19))
      ])),
    );
  }

  Widget buildPrice(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Text.rich(TextSpan(
        children: [
          TextSpan(
            text: "￥",
            style: TextStyle(fontSize: 13, color: Colors.red, fontWeight: FontWeight.bold)
          ),
          TextSpan(
              text: "15",
              style: TextStyle(fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold)
          ),
          TextSpan(
              text: ".9",
              style: TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold)
          ),
          TextSpan(
              text: " ",
          ),
          WidgetSpan(
              child: Container(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                child: Text("满29元0运费", style: TextStyle(fontSize: 14, color: Colors.red)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: Colors.red,
                    width: 0.5
                  )
                ),
              )
          )
        ]
      )),
    );
  }

  Widget buildLocation(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Color.fromRGBO(241, 241, 241, 1),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Container(width: 5,),
            Container(
              clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image(image: AssetImage("assets/images/meituan/meituan_maicai.webp"), width: 20,)
            ),
            Container(width: 5,),
            Text("买团买菜(酒仙桥东站)")
          ],
        ),
      ),
    );
  }
}
