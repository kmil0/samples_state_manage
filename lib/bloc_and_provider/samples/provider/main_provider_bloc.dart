import 'package:flutter/material.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';

class MainProviderBLoC extends ChangeNotifier {
  final CounterRepository counterRepository;

  MainProviderBLoC(this.counterRepository);

  int counter = 0;

  Future<void> increment() async {
    counter = await counterRepository.process(counter);
    notifyListeners();
  }
}
