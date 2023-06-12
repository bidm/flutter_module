import 'package:flutter/material.dart';

class WeiBoPost extends StatefulWidget {
  const WeiBoPost({Key? key}) : super(key: key);

  static String routeName = "/post";

  @override
  State<WeiBoPost> createState() => _WeiBoPostState();
}

class _WeiBoPostState extends State<WeiBoPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发布微博"),
      ),
      body: Container(
        child: TextField(

        ),
      ),
    );
  }
}
