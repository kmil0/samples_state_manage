import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_and_provider/samples/counter_services.dart';

class MainCubitBLoC extends Cubit<int> {
  final CounterRepository counterRepository;

  MainCubitBLoC(this.counterRepository) : super(0);

  Future<void> increment() async {
    final counter = await counterRepository.process(state);
    emit(counter);
  }
}
