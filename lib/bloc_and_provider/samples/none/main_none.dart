import 'package:flutter/material.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';
import 'package:state_management/bloc_and_provider/samples/dialog_utils.dart';
import 'package:state_management/bloc_and_provider/samples/none/main_none_bloc.dart';

class MainNone extends StatefulWidget {
  @override
  _MainNoneState createState() => _MainNoneState();
}

class _MainNoneState extends State<MainNone> {
  final mainBloc = MainNoneBLoC(CounterService());

  @override
  Widget build(BuildContext context) {
    return _CounterInherited(
        bloc: mainBloc, child: MyHomePage(title: 'No packages'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainNoneBLoC bloc;

  void _listenCounter() {
    if (bloc.counter > 0 && bloc.counter % 5 == 0) {
      showHelloDialog(context, 'None');
    }
  }

  @override
  void initState() {
    bloc = _CounterInherited.of(context);
    bloc.addListener((_listenCounter));
    super.initState();
  }

  @override
  void dispose() {
    bloc.removeListener((_listenCounter));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _CounterBody(),
        floatingActionButton:
            _CounterButton() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class _CounterBody extends StatelessWidget {
  const _CounterBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          _CounterText(),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = _CounterInherited.of(context);
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
  const _CounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = _CounterInherited.of(context);
    return FloatingActionButton(
      onPressed: bloc.increment,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

class _CounterInherited extends InheritedWidget {
  _CounterInherited({Widget child, this.bloc}) : super(child: child);

  final MainNoneBLoC bloc;

  static MainNoneBLoC of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<_CounterInherited>().bloc;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
