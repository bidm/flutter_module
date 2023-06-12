import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomContainer("相册", 50, 100, Colors.red, () {print("点击了相册");}),
          Container(height: 10,),
          CustomContainer("相机", 50, 100, Colors.green, () {print("点击了相机");}),
          Container(height: 10,),
          CustomContainer("定位权限", 50, 100, Colors.brown, () {print("点击了定位");}),
          Container(height: 10,),
          CustomContainer("push权限", 50, 100, Colors.yellow, () {print("点击了push");}),
          Container(height: 10,),
          CustomContainer("通讯录", 50, 100, Colors.pink, () {print("点击了通讯录");}),
          Container(height: 10,),
          CustomContainer("缓存信息", 50, 100, Colors.purple, () {print("点击了缓存");}),
          Container(height: 10,),
          CustomContainer("获取缓存", 50, 100, Colors.blue, () {print("点击了获取缓存");}),
          Container(height: 10,),
          CustomContainer("ceshi", 100, 100, Colors.red, () {print("123");}, paramCallBack: (p0) {print(p0);})
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {

  final String title;
  final double height;
  final double width;
  final Color color;
  final VoidCallback callBack;
  final Function(String)? paramCallBack;

  const CustomContainer(this.title, this.height, this.width, this.color, this.callBack, {this.paramCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      color: color,
      child: GestureDetector(
        onTap: callBack,
        onDoubleTap: (){
          paramCallBack!("12345");
        },
        child: Text(title),
      ),
    );
  }
}

