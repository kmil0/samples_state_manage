import 'package:flutter/material.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';

class MainNoneBLoC extends ChangeNotifier {
  final CounterRepository counterRepository;

  MainNoneBLoC(this.counterRepository);

  int counter = 0;

  Future<void> increment() async {
    counter = await counterRepository.process(counter);
    notifyListeners();
  }
}
