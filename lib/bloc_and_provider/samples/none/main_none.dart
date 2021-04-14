import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';
import 'package:state_management/bloc_and_provider/samples/dialog_utils.dart';
import 'package:state_management/bloc_and_provider/samples/none/main_none_bloc.dart';

class MainNone extends StatelessWidget {
  final service = CounterService();

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'No packages', service: service);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.service}) : super(key: key);
  final String title;
  final CounterRepository service;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainNoneBLoC bloc;

  void _incrementCounter() async {
    await bloc.increment();
    if (bloc.counter > 0 && bloc.counter % 5 == 0) {
      showHelloDialog(context, 'None');
    }
  }

  @override
  void initState() {
    bloc = MainNoneBLoC(widget.service);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _CounterBody(bloc: bloc),
        floatingActionButton: _CounterButton(
          onTap: _incrementCounter,
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class _CounterBody extends StatelessWidget {
  const _CounterBody({Key key, this.bloc}) : super(key: key);
  final MainNoneBLoC bloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          _CounterText(bloc: bloc),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key key, this.bloc}) : super(key: key);
  final MainNoneBLoC bloc;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bloc,
      builder: (context, _) {
        return Text(
          '${bloc.counter}',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}

class _CounterButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CounterButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
