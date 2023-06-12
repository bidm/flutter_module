import 'dart:convert';
// import 'package:fair/fair.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/module/dynamic/dynamic_page1.dart';
import 'package:flutter_module/module/weibo/weibo_model.dart';
import 'package:flutter_module/module/weibo/weibo_photo_view.dart';

class WeiBoItem extends StatefulWidget {

  final Status statusModel;

  const WeiBoItem(this.statusModel, {Key? key}) : super(key: key);

  @override
  State<WeiBoItem> createState() => _WeiBoItemState();
}

class _WeiBoItemState extends State<WeiBoItem> {
  User? user;
  List<String?>? images;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    user = widget.statusModel.user;
    images = widget.statusModel.iamges;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 10, color: Colors.white,),
        buildUserInfo(),
        Container(height: 15, color: Colors.white,),

        buildContentInfo(),
        Container(height: 8, color: Colors.white,),

        buildImages(),
        Container(height: 15, color: Colors.white,),

        buildHotSearchInfo(),
        Container(height: 15, color: Colors.white,),

        Container(color: const Color(0xFFD6D6D6), height: 0.4,),
        Container(height: 8, color: Colors.white,),

        buildBottomTool(),
        Container(height: 15, color: const Color(0xFFEEEEEE),),
      ],
    );
  }

  Widget buildUserInfo() {
    return Stack(
      children: [
        Row(
          children: [
            builduserIcon(),
            Container(width: 10,),

            buildUserName(),
            buildAttentionInfo()
          ],
        ),
      ],
    );
  }

  Widget builduserIcon(){
    return Stack(
      children: [
        Container(
            clipBehavior: Clip.hardEdge,
            decoration:
            BoxDecoration(
                borderRadius: BorderRadius.circular(27.5),
            ),
          child: Image.network("https://tvax1.sinaimg.cn/crop.0.0.896.896.180/ad517871ly8h0s4bcpo7bj20ow0ow74v.jpg?KID=imgbed,tva&Expires=1660629403&ssig=rUEqQcvMZE", width: 55,),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 20,
            width: 20,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
            ),
            child: const Image(image: AssetImage("assets/images/weibo/weibo_dav.png")),
          ),
        ),
      ],
    );
  }

  Widget buildUserName() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
            children:[
              TextSpan(
                  text: user?.name ?? "",
                  style: const TextStyle(fontSize: 20, color: Colors.orange)
              ),
              const TextSpan(
                  text: " ",
                  style: TextStyle(fontSize: 20)
              ),
              const WidgetSpan(
                  child: Image(image: AssetImage("assets/images/weibo/weibo_vip.png"), width: 20,)
              ),
            ]
          )),
          Container(
            height: 5,
          ),
          Text(user?.desc ?? "",
            style: const TextStyle(fontSize: 17, color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }

  Widget buildAttentionInfo() {
    final String attent = (user?.isAttention == true) ? "取消关注" : "关注";
    final double attentWidth = (user?.isAttention == true) ? 80 : 60;

    return SizedBox(
      height: 60, width: 90,

      child: Stack(
        children: [
          Positioned(
              top: 15,
              right: 0,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange, width: 0.6)
                  ),
                  width: attentWidth,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(attent, style: const TextStyle(color: Colors.orange),),
                ),
                onTap: (){
                  // setState(() {
                  //   if (user?.isAttention == true) {
                  //     user?.isAttention = false;
                  //   } else {
                  //     user?.isAttention = true;
                  //   }
                  // });


                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       // return DynamicPage1();
                  //       return FairWidget(
                  //           path: 'assets/bundles/lib_module_dynamic_dynamic_page1.fair.json',
                  //           data: {'fairProps': jsonEncode({'title': '动态页面Title', 'content': '动态页面Content'})}
                  //       );
                  //     }
                  // ));



                },
              )
          )
        ],
      ),
    );
  }

  Widget buildContentInfo() {
    return Text(widget.statusModel.content ?? "" , style: const TextStyle(fontSize: 19),);
  }

  Widget buildImages() {
    return GridView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.0),
      children: List.generate(images?.length ?? 0, (index) {
        return GestureDetector(
          child: Image.network(images?[index] ?? "", fit: BoxFit.cover,),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext ctx){
                  return WeiBoPhotoViewPage(images: images ?? [], index: index, controller: null, heroTag: '',);
                }));
          },
        );
      }),
    );
  }

  Widget buildHotSearchInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 25,
            padding: const EdgeInsets.fromLTRB(6, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5),
              border: Border.all(color: Colors.orange)
            ),
            child: const Text.rich(TextSpan(
              children: [
                WidgetSpan(
                  child: Image(image: AssetImage("assets/images/weibo/weibo_hottag.png"), width: 45,),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  text: "佩洛西访问台湾",
                  style: TextStyle(fontSize: 16)
                )
              ]
            )),
          ),
          onTap: (){
            print("点击了热搜");
          },
        ),
      ],
    );
  }

  Widget buildBottomTool() {
    String likePath = "assets/images/weibo/weibo_like.png";
    if (widget.statusModel.liked == true) {
      likePath = "assets/images/weibo/weibo_liked.png";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeiboBottomTool(const Image(image: AssetImage("assets/images/weibo/weibo_share.png"),width: 15,), "${widget.statusModel.shareCount}", shareCallBack),
        WeiboBottomTool(const Image(image: AssetImage("assets/images/weibo/weibo_comment.png"),width: 15,), "${widget.statusModel.commentCount}", commentCallBack),
        WeiboBottomTool(Image(image: AssetImage(likePath),width: 15,), "${widget.statusModel.likeCount}", likeCallBack),
      ],
    );
  }

  void shareCallBack(){
    print("shareCallBack");
  }

  void commentCallBack(){
    print("commentCallBack");
  }

  void likeCallBack(){
    print("favouriteCallBack");
    setState(() {
      // widget.statusModel.liked != widget.statusModel.liked;
      if (widget.statusModel.liked == true) {
        widget.statusModel.liked = false;
      } else {
        widget.statusModel.liked = true;
      }
      widget.statusModel.likeCount = (widget.statusModel.likeCount! + 1) ;
    });
  }


}

class WeiboBottomTool extends StatelessWidget {

  final Widget icon;
  final String title;
  @required VoidCallback callBack;

  WeiboBottomTool(this.icon, this.title, this.callBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container (
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        // color: Colors.red,
        height: 35,
        // width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Container(
              width: 5,
            ),
            Text(title),
          ],
        ),
      ),
      onTap: callBack,
    );
  }
}

