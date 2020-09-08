import 'package:artifact/demo/frame/bloc/bloc_demo.dart';
import 'package:artifact/demo/frame/rxdart/rxdart_demo.dart';
import 'package:artifact/demo/frame/stream/stream_demo2.dart';
import 'package:artifact/page/book/book_page.dart';
import 'package:artifact/page/frame/frame_page.dart';
import 'package:artifact/page/home/home_page.dart';
import 'package:artifact/page/study/container_page.dart';
import 'package:artifact/page/widget/widget_page.dart';
import 'package:artifact/res/dimens.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';


import 'demo/frame/stream/stream_demo.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.ROUTER_NAME: (context) => new HomePage(),
  WidgetPage.ROUTER_NAME: (context) => new WidgetPage(),
  FramePage.ROUTER_NAME: (context) => new FramePage(),
  BookPage.ROUTER_NAME: (context) => new BookPage(),
  ContainerPage.ROUTER_NAME: (context) => new ContainerPage(),
  StreamDemo.ROUTER_NAME: (context) => new StreamDemo(),
  StreamDemo2.ROUTER_NAME: (context) => new StreamDemo2(),
  BlocDemo.ROUTER_NAME: (context) => new BlocDemo(),
  RxDartDemo.ROUTER_NAME: (context) => new RxDartDemo(),
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: UiAdapter(),
    );
  }
}

class UiAdapter extends StatefulWidget {
  @override
  _UiAdapterState createState() => _UiAdapterState();
}

class _UiAdapterState extends State<UiAdapter> {
  @override
  Widget build(BuildContext context) {
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context,
        width: Dimens.ui_width,
        height: Dimens.ui_height,
        allowFontScaling: true);
    return HomePage();
  }
}
