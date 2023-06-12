import 'package:flutter/material.dart';
import 'package:flutter_module/main/init_tabbar_configs.dart';
import 'package:flutter_module/share/device_util.dart';

class TabbarContentPage extends StatefulWidget {
  const TabbarContentPage({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  State<TabbarContentPage> createState() => _TabbarContentPageState();
}

class _TabbarContentPageState extends State<TabbarContentPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: InitTabBarConfig.pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: InitTabBarConfig.items,
        selectedItemColor: Colors.orange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
