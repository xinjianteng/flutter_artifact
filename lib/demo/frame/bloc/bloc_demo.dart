import 'dart:async';

import 'package:flutter/material.dart';

import 'counter_bloc_demo.dart';

class BlocDemo extends StatelessWidget {
  static const String ROUTER_NAME = "/blocDemo";

  @override
  Widget build(BuildContext context) {
    return BlocDemoHome();
  }
}

class BlocDemoHome extends StatefulWidget {
  @override
  _BlocDemoHomeState createState() => _BlocDemoHomeState();
}

class _BlocDemoHomeState extends State<BlocDemoHome> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('bloc'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CountActionButton(),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 22;

  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void log() {
    print('bloc');
  }

  void onData(int data) {
    print('$data');
    _count = data * _count;
    _counterController.add(_count);
  }

  void disponse() {
    _counterController.close();
    _counterActionController.close();
  }
}
