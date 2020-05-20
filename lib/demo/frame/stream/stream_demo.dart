import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StreamDemo extends StatelessWidget {
  
  static const String ROUTER_NAME = "/streamdemo";
  
  @override
  Widget build(BuildContext context) {
    return StreamDemoHome();
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  var value = "xxxxxxxx";
  
  @override
  void initState() {
    super.initState();
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo.listen(onData, onError: onError, onDone: onDone);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().uiHeightPx.toDouble(),
      width: ScreenUtil().uiWidthPx.toDouble(),
      child: Text(value),
    );
  }
  
  //注意此处error不能定义类型，假使参数设为String error 是不能编辑通过
  void onError(error) {
    print('error: $error');
    onData(error);
  }
  
  Future<String> fetchData() async {
    //延迟3秒执行
    await Future.delayed(Duration(seconds: 3));
    throw "something error";
//    return "hello~";
  }
  
  void onData(data) {
    print('$data');
    setState(() {
      value = data;
    });
  }
  
  
  void onDone() {
    print('onDone');
  }
}


//初始化数据initstate
//创建一个stream
//监听stream

