abstract class CounterRepository {
  Future<int> process(int value);
}

class CounterService extends CounterRepository {
  @override
  Future<int> process(int value) async {
    return value + 1;
  }
}
