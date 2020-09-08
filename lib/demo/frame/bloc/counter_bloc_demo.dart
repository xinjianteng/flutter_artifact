import 'package:artifact/demo/frame/bloc/bloc_demo.dart';
import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CountActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        _counterBloc.counter.add(11);
      },
    );
  }
}
