import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  static const String ROUTER_NAME = "/study/rxDartDemo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rxDart'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Observable<String> _observable =
//        Observable(Stream.fromIterable(['Stream.fromIterable', 'Stream.fromIterable']));
//        Observable.fromFuture(Future.value("Observable.fromFuture"));
//        Observable.fromIterable(['Observable.fromIterable11', 'Observable.fromIterable22']);
//        Observable.just('observable.just');
        Observable.periodic(Duration(seconds: 3), (x) => x.toString());

    _observable.listen(print);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
