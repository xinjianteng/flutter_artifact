import 'package:artifact/page/book/book_page.dart';
import 'package:artifact/page/frame/frame_page.dart';
import 'package:artifact/page/home/widge/home_menu.dart';
import 'package:artifact/page/widget/widget_page.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
    WidgetPage(),
    FramePage(),
    BookPage(),
  ];

  static const int HOME_WIDGET = 0;
  static const int HOME_FRAME = 1;
  static const int HOME_BOOK = 2;

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
                HomeMenu(HOME_WIDGET, Strings.menuWidget, Icons.widgets),
                HomeMenu(HOME_FRAME, Strings.menuLibrary, Icons.filter_frames),
                HomeMenu(HOME_BOOK, Strings.menuBook, Icons.book),
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
