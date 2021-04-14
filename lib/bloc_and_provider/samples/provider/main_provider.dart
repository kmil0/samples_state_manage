import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';
import 'package:state_management/bloc_and_provider/samples/dialog_utils.dart';
import 'package:state_management/bloc_and_provider/samples/provider/main_provider_bloc.dart';

class MainProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CounterRepository>(
      create: (_) => CounterService(),
      child: MaterialApp(
        // theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Provider'),
      ),
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
  MainProviderBLoC bloc;

  void _listenCounter() {
    if (bloc.counter > 0 && bloc.counter % 5 == 0) {
      showHelloDialog(context, 'None');
    }
  }

  @override
  void initState() {
    bloc = MainProviderBLoC(context.read());
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
    return ChangeNotifierProvider(
        create: (_) => bloc,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: _CounterBody(),
              floatingActionButton: _CounterButton());
        });
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
    final bloc = Provider.of<MainProviderBLoC>(context);
    return Text(
      '${bloc.counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MainProviderBLoC>(context, listen: false);
    return FloatingActionButton(
      onPressed: bloc.increment,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
