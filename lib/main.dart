import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/bloc_and_provider/samples/flutter_bloc/main_flutter_bloc.dart';
import 'package:state_management/bloc_and_provider/samples/none/main_none.dart';
import 'package:state_management/bloc_and_provider/samples/provider/main_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc and Provider',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management Samples"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _openPage(context, MainNone()),
                  child: Text("Sample Default"),
                ),
                ElevatedButton(
                  onPressed: () => _openPage(context, MainFlutterBloc()),
                  child: Text("Sample BLoC with Flutter Bloc"),
                ),
                ElevatedButton(
                  onPressed: () {
                    //   final page = SampleProviderNotifier();
                    //   _openPage(
                    //     context,
                    //     MultiProvider(
                    //       providers: [
                    //         ChangeNotifierProvider(
                    //             create: (_) => ProviderNotifier()),
                    //       ],
                    //       child: MaterialApp(
                    //         home: page,
                    //       ),
                    //     ),
                    //   );
                  },
                  child: Text("Sample Provider Notifier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
