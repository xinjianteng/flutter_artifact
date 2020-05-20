import 'package:artifact/demo/ImageTest.dart';
import 'package:artifact/demo/containerTest.dart';
import 'package:artifact/demo/testDemoPage.dart';
import 'package:artifact/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewPage extends StatelessWidget {
  static const String ROUTER_NAME = "/TestPage";


  @override
  Widget build(BuildContext context) {
    return NewPageHome();
  }
}

class NewPageHome extends StatefulWidget {
  @override
  _NewPageHomeState createState() => _NewPageHomeState();
}

class _NewPageHomeState extends State<NewPageHome> {
  
  var data={
    res.testContainer:ContainerTest(),
    res.testImage:ImageTest(),
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            testName: res.testContainer,
            testWidget: ContainerTest(),
          ),
          ListViewItem(
            testName: res.testImage,
            testWidget: ImageTest(),
          )
        ],
      ),
    );
  }
}




class ListViewItem extends StatefulWidget {
  final String testName;
  final StatelessWidget testWidget;

  const ListViewItem({Key key, this.testName, this.testWidget})
      : super(key: key);

  @override
  _ListViewItemState createState() {
    // TODO: implement createState
    return _ListViewItemState();
  }
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text(widget.testName),
      onPressed: () {
        //导航到新路由
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return TestDemoPage(
            testWidget: widget.testWidget,
            testName: widget.testName,
          );
        }));
      },
    );
  }
}
