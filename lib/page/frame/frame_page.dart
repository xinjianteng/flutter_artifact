import 'package:artifact/demo/ImageTest.dart';
import 'package:artifact/demo/frame/bloc/bloc_demo.dart';
import 'package:artifact/page/common/listViewItem.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FramePage extends StatelessWidget {
  static const String ROUTER_NAME = "/framePage";


  @override
  Widget build(BuildContext context) {
    return FramePageHome();
  }
}

class FramePageHome extends StatefulWidget {
  @override
  _FramePageHomeState createState() => _FramePageHomeState();
}

class _FramePageHomeState extends State<FramePageHome> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            testName: Strings.blog,
            testWidget: BlocDemo(),
          ),
          ListViewItem(
            testName: Strings.testImage,
            testWidget: ImageTest(),
          )
        ],
      ),
    );
  }
}


