import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/share/device_util.dart';

class MeiTuanItem3 extends StatefulWidget {
  const MeiTuanItem3({Key? key}) : super(key: key);

  @override
  State<MeiTuanItem3> createState() => _MeiTuanItem3State();
}

class _MeiTuanItem3State extends State<MeiTuanItem3> {
  double currentPage = 0.0;
  final List images1 = [
    "meituan_item3_1.jpeg",
    "meituan_item3_2.jpeg",
    "meituan_item3_3.jpeg",
    "meituan_item3_4.jpeg",
    "meituan_item3_5.jpeg",
    "meituan_item3_6.jpeg",
    "meituan_item3_7.jpeg",
    "meituan_item3_8.jpeg",
    "meituan_item3_9.jpeg",
    "meituan_item3_10.jpeg",
  ];
  final List titles1 = [
    "美食",
    "酒店",
    "休闲",
    "电影",
    "宠物",
    "饮品",
    "理发",
    "水果",
    "手机",
    "生活",
  ];
  final List images2 = [
    "meituan_item3_11.jpeg",
    "meituan_item3_12.jpeg",
    "meituan_item3_13.jpeg",
    "meituan_item3_14.jpeg",
    "meituan_item3_15.jpeg",
    "meituan_item3_16.jpeg",
    "meituan_item3_17.jpeg",
    "meituan_item3_18.jpeg",
    "meituan_item3_19.jpeg",
    "meituan_item3_20.jpeg",
  ];
  final List titles2 = [
    "借钱",
    "景点",
    "医疗",
    "按摩",
    "宠物股",
    "现金",
    "送菜",
    "美容",
    "养车",
    "红包",
  ];
  final List images3 = [
    "meituan_item3_21.jpeg",
    "meituan_item3_22.jpeg",
    "meituan_item3_23.jpeg",
    "meituan_item3_24.jpeg",
    "meituan_item3_25.jpeg",
    "meituan_item3_26.jpeg",
    "meituan_item3_27.jpeg",
    "meituan_item3_28.jpeg",
    "meituan_item3_29.jpeg",
    "meituan_item3_30.jpeg",
  ];
  final List titles3 = [
    "赚钱",
    "结婚",
    "KTV",
    "洗浴",
    "亲子",
    "健身",
    "培训",
    "有钱",
    "福利",
    "服务",
  ];

  final double itemsTotalHeight = 220;

  final double itemContentHeight = 220 - 10;

  final int itemCount = 5;

  final double leftMargin = 10;

  final double itemHMargin = 10;

  final double itemVMargin = 10;

  final double itemTopMargin = 5;

  double getItemHeight(BuildContext ctx) {
    return (itemContentHeight - itemVMargin - itemTopMargin) / 2.0 - 10;
  }

  double getItemWidth(BuildContext ctx) {
    final double itemContentWidth = DeviceConst.screenWidth(ctx) - 20;
    double itemsMargin = (itemCount - 1) * itemHMargin;
    return (itemContentWidth - itemsMargin) / itemCount;
  }

  double getItemRatio(BuildContext ctx) {
    double width = getItemWidth(ctx);
    double height = getItemHeight(ctx);
    return width / height;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromRGBO(241, 241, 241, 1),
          height: itemsTotalHeight,
        ),
        Positioned(
            top: 0,
            left: leftMargin,
            right: leftMargin,
            height: itemContentHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, itemTopMargin, 0, 0),
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      children: [
                        buildPageViewItem(images1, titles1, context),
                        buildPageViewItem(images2, titles2, context),
                        buildPageViewItem(images3, titles3, context),
                      ],
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value.toDouble();
                        });
                      },
                    ),
                    Positioned(
                        height: 20,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: currentPage,
                          decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: Colors.orangeAccent,
                          ),
                        ))
                  ],
                ),

              ),
            )),
      ],
    );
  }

  Widget buildPageViewItem(List images, List titles, BuildContext ctx) {

    return Container(
      // color: Colors.green,
      child: GridView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: itemCount,
          mainAxisSpacing: itemVMargin,
          crossAxisSpacing: itemHMargin,
          childAspectRatio: getItemRatio(ctx),
        ),
        children: List.generate(images.length, (index) {
          return GestureDetector(
            child: buildItems(images[index], titles[index], context),
          );
        }),
      ),
    );
  }

  Widget buildItems(String image, String title, BuildContext ctx) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: getItemHeight(ctx),
        width: getItemWidth(ctx),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/meituan/$image"),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
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
