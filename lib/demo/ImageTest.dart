import 'package:flutter/material.dart';

class ImageTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ContainerDemo(
          child: Column(
            children: <Widget>[
              Text('加载网络图片 宽=120；高=120； fix:BoxFix.none(原始大小)'),
              Image(
                image: NetworkImage(
                  "http://pvc0fusij.bkt.clouddn.com/Tin_Flutter.png",
                ),
                width:150.0,
                height:150.0,
                fit: BoxFit.none,
              ),
            ],
          ),
        ),
        ContainerDemo(
          child: Column(
            children: <Widget>[
              Text('加载网络图片 宽=120；高=120； fix:BoxFix.none(原始大小)'),
              Image(
                image: NetworkImage(
                  "http://pvc0fusij.bkt.clouddn.com/Tin_Flutter.png",
                ),
                width:150.0,
                height:150.0,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        ContainerDemo(
          child: Column(
            children: <Widget>[
              Text('加载网络图片 宽=120；高=120； fix:BoxFix.none(原始大小)'),
              Image(
                image: NetworkImage(
                  "http://pvc0fusij.bkt.clouddn.com/Tin_Flutter.png",
                ),
                width:150.0,
                height:150.0,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),

      ],
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: child,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.blue[200],
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
