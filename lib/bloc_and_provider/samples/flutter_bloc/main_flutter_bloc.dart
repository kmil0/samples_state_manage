import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';
import 'package:state_management/bloc_and_provider/samples/dialog_utils.dart';
import 'package:state_management/bloc_and_provider/samples/flutter_bloc/main_cubit_bloc.dart';

class MainFlutterBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CounterRepository>(
      create: (_) => CounterService(),
      child: MaterialApp(
        // theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Provider'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubitBLoC>(
      create: (_) => MainCubitBLoC(context.read()),
      child: BlocListener<MainCubitBLoC, int>(
        listener: (context, value) {
          if (value > 0 && value % 5 == 0) {
            showHelloDialog(context, 'flutter_bloc');
          }
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(this.title),
            ),
            body: _CounterBody(),
            floatingActionButton: _CounterButton()),
      ),
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
    final bloc = BlocProvider.of<MainCubitBLoC>(context, listen: true);
    return Text(
      '${bloc.state}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainCubitBLoC>(context);
    return FloatingActionButton(
      onPressed: bloc.increment,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
