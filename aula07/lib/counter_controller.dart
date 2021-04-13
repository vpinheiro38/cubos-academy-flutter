import 'counter_model.dart';

class CounterController {
  final model = CounterModel();

  String getCounter() => model.counter.toString();

  incrementCounter() => model.modifyCounter(1, add);
  decrementCounter() => model.modifyCounter(1, sub);

  int add(int a, int b) => a + b;
  int sub(int a, int b) => a - b;
}
