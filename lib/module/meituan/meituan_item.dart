import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MeiTuanTopItem extends StatelessWidget {
  // const MeiTuanTopItem({Key? key}) : super(key: key);

  final ImagePicker picker = ImagePicker();

  Future<void> getLostData() async {
    final LostDataResponse response =
    await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      print("object = ${response.files}");
      // for (final XFile file in response.files) {
      //   _handleFile(file);
      // }
    } else {
      // _handleError(response.exception);
      print("object = cuowu");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 90,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: buildItems("assets/images/meituan/meituan_item1.webp", "扫一扫"),
              onTap: (){
              print("点击了扫一扫");
                getLostData();
              },
          ),
          buildItems("assets/images/meituan/meituan_item2.webp", "骑车"),
          buildItems("assets/images/meituan/meituan_item3.webp", "打车"),
          buildItems("assets/images/meituan/meituan_item4.webp", "火车票"),
          buildItems("assets/images/meituan/meituan_item5.webp", "跑腿"),
        ],
      ),
    );
  }

  Widget buildItems(String image, String title) {
    return Container(
        // color: Colors.red,
        alignment: Alignment.center,
        height: 80,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: 40,
            ),
            Container(
              height: 5,
            ),
            Text(title)
          ],
        ));
  }
}
