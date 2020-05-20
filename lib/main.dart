import 'package:artifact/demo/frame/stream/stream_demo2.dart';
import 'package:artifact/page/home/home_page.dart';
import 'package:artifact/res/dimens.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'demo/frame/stream/stream_demo.dart';


final Map<String, WidgetBuilder> routes = {
  HomePage.ROUTER_NAME: (context) => new HomePage(),
  StreamDemo.ROUTER_NAME: (context) => new StreamDemo(),
  StreamDemo2.ROUTER_NAME: (context) => new StreamDemo2(),
};


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: res.appName,
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
        width: ADimens.ui_width,
        height: ADimens.ui_height,
        allowFontScaling: true);
    return HomePage();
  }
}
