import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo2 extends StatelessWidget {
  static const String ROUTER_NAME = "/streamDemo2";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("streamDemo2"),
        elevation: 10.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamController<String> _streamController;
  StreamSubscription _streamSubscription;
  StreamSink _streamSink;
  String _data = '...';
  
  @override
  void initState() {
    super.initState();
    print('create a stream.');
    _streamController = new StreamController.broadcast();
    
    print('listener the stream.');
    _streamSubscription = _streamController.stream
        .listen(onData, onError: onError, onDone: onDone);
    
    _streamSubscription = _streamController.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);
    
    print('set steamController sink');
    _streamSink = _streamController.sink;
    
    print('initialize completed.');
  }
  
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _data,
              style: TextStyle(fontSize: 50.0),
            ),
            StreamBuilder(
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
              stream: _streamController.stream,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _addStream,
                  child: Text('add'),
                ),
                FlatButton(
                  onPressed: _pauseStream,
                  child: Text('pause'),
                ),
                FlatButton(
                  onPressed: _resumeStream,
                  child: Text('resume'),
                ),
                FlatButton(
                  onPressed: _cancelStream,
                  child: Text('cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Future<String> featchData() async {
    await Future.delayed(Duration(seconds: 5));
    return "hello ~";
//    throw 'something happended';
  }
  
  void onData(String event) {
    print('$event');
    setState(() {
      _data = event;
    });
  }
  
  void onDataTwo(String event) {
    print('two $event');
  }
  
  void onDone() {
    print('onDone');
  }
  
  onError(error) {
    print('onError:$error');
  }
  
  void _pauseStream() {
    print('pause');
    _streamSubscription.pause();
  }
  
  void _addStream() async {
    print('addStream');
    var data = await featchData();
    _streamSink.add(data);
  }
  
  void _resumeStream() {
    print('resume');
    _streamSubscription.resume();
  }
  
  void _cancelStream() {
    print('cancel');
    _streamSubscription.cancel();
  }
}
