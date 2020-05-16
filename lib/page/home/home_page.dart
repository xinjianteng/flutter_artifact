import 'package:artifact/page/home/widge/home_menu.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:artifact/page/new/new_page.dart';


class HomePage extends StatelessWidget {
  static const String ROUTER_NAME = "/HomePage";

  @override
  Widget build(BuildContext context) {
    return HomePageHome();
  }
}

class HomePageHome extends StatefulWidget {
  @override
  _HomePageHomeState createState() => _HomePageHomeState();
}

class _HomePageHomeState extends State<HomePageHome> {
  //点击导航项是要显示的页面
  final pages = [
    NewPage(),
    NewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: HomeModel(),
      child: ScopedModelDescendant<HomeModel>(
        builder: (context, _, model) => Scaffold(
          body: pages[model.current],
          bottomNavigationBar: BottomAppBar(
            notchMargin: 0,
            elevation: 0,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HomeMenu(
                  0,
                  res.menuWidget,
                  Icons.widgets
                ),
                HomeMenu(
                  1,
                  res.menuWidget,
                  Icons.widgets
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeModel extends Model {
  int _current = 0;

  int get current => _current;

  void setCurrent(int homeMenuPosition) {
    _current = homeMenuPosition;
    notifyListeners();
  }
}
