import 'package:artifact/demo/ImageTest.dart';
import 'package:artifact/page/common/listViewItem.dart';
import 'package:artifact/page/study/container_page.dart';
import 'package:artifact/page/study/text_page.dart';
import 'package:artifact/page/study/webview_page.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  static const String ROUTER_NAME = "/widgetPage";

  @override
  Widget build(BuildContext context) {
    return WidgetPageHome();
  }
}

class WidgetPageHome extends StatefulWidget {
  @override
  _WidgetPageHomeState createState() => _WidgetPageHomeState();
}

class _WidgetPageHomeState extends State<WidgetPageHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            testName: Strings.widgetIntro,
            testWidget: WebViewPage(),
          ),
          ListViewItem(
            testName: Strings.textStr,
            testWidget: TextPage(),
          ),
          ListViewItem(
            testName: Strings.containerStr,
            testWidget: ContainerPage(),
          ),
          ListViewItem(
            testName: Strings.imageStr,
            testWidget: ContainerPage(),
          )
        ],
      ),
    );
  }
}

