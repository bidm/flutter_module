// import 'package:fair/fair.dart';
// import 'package:flutter/material.dart';
//
// // flutter pub run build_runner build
//
// @FairPatch()
// class DynamicPage1 extends StatefulWidget {
//   DynamicPage1({Key? key, this.fiarProps}) : super(key: key);
//
//   dynamic fiarProps;
//
//   @override
//   State<DynamicPage1> createState() => _DynamicPage1State();
// }
//
// class _DynamicPage1State extends State<DynamicPage1> {
//
//
//   @FairProps()
//   var fairProps;
//
//   @override
//   void initState() {
//     super.initState();
//     fairProps = widget.fiarProps;
//   }
//
//   String getTitle(){
//     if (fairProps == null) {return "无参数 title";}
//     return fairProps["title"];
//   }
//
//   String getContent(){
//     if (fairProps == null) {return "无参数 content";}
//     return fairProps["content"];
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${getTitle()}"),
//       ),
//       body: Center(
//         child: Text("${getContent()}", style: TextStyle(fontSize: 30),),
//       ),
//     );
//   }
// }
