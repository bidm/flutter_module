import 'package:flutter/material.dart';

class MeiTuanItem2 extends StatelessWidget {
  const MeiTuanItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromRGBO(241, 241, 241, 1),
          height: 140,
        ),
        Container(
          color: Colors.yellow,
          height: 50,
        ),
        Positioned(
            height: 135,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 8, 20, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black38,
                //     offset: Offset(0, 0.5),
                //     blurRadius: 0.5
                //   )
                // ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "美食百货，随叫随到",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildItems(
                          "assets/images/meituan/meituan_item2_1.jpeg", "外卖"),
                      buildItems(
                          "assets/images/meituan/meituan_item2_2.jpeg", "美团买菜"),
                      buildItems(
                          "assets/images/meituan/meituan_item2_3.jpeg", "便利店"),
                      buildItems(
                          "assets/images/meituan/meituan_item2_4.jpeg", "大型超市"),
                      buildItems(
                          "assets/images/meituan/meituan_item2_5.jpeg", "买药"),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }

  Widget buildItems(String image, String title) {
    return Container(
        // color: Colors.red,
        alignment: Alignment.center,
        height: 80,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: 50,
            ),
            Container(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17),
            )
          ],
        ));
  }
}
