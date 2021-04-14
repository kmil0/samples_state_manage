import 'package:flutter/material.dart';

class MainFlutterBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _CounterBody(
          counter: _counter,
        ),
        floatingActionButton: _CounterButton(
          onTap: _incrementCounter,
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class _CounterBody extends StatelessWidget {
  const _CounterBody({Key key, this.counter}) : super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          _CounterText(counter: counter),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key key, this.counter}) : super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
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
