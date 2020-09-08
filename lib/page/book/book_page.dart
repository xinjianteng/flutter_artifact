import 'package:artifact/demo/ImageTest.dart';
import 'package:artifact/page/common/listViewItem.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';


class BookPage extends StatelessWidget {
  static const String ROUTER_NAME = "/bookPage";


  @override
  Widget build(BuildContext context) {
    return BookPageHome();
  }
}

class BookPageHome extends StatefulWidget {
  @override
  _BookPageHomeState createState() => _BookPageHomeState();
}

class _BookPageHomeState extends State<BookPageHome> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            testName: Strings.containerStr,
            testWidget: ContainerDemo(),
          ),
          ListViewItem(
            testName: Strings.imageStr,
            testWidget: ImageTest(),
          )
        ],
      ),
    );
  }
}


