import 'package:flutter/material.dart';
import 'package:statsfl/statsfl.dart';
import 'router/router_util.dart';
// import 'package:fair/fair.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // FairApp.runApplication(
  //   _getApp(),
  //   plugins: {},
  // );

  runApp(StatsFl(
    isEnabled: true,
    align: Alignment.bottomRight,
    height: 35,
    width: 150,
    child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()),
  ),
  );

}

// dynamic _getApp() => FairApp(
//   modules: {},
//   delegate: {},
//   child: StatsFl(
//     isEnabled: true,
//     align: Alignment.bottomRight,
//     height: 35,
//     width: 150,
//     child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()),
//   ),
// );

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutersUtil.routers,
      initialRoute: RoutersUtil.initRoute,
    );
  }
}
