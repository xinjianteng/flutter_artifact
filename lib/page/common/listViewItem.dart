import 'package:flutter/material.dart';

class ListViewItem extends StatefulWidget {
  final String testName;
  final StatelessWidget testWidget;

  const ListViewItem({
    Key key,
    this.testName,
    this.testWidget,
  }) : super(key: key);

  @override
  _ListViewItemState createState() {
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
          return widget.testWidget;
        }));
      },
    );
  }
}
