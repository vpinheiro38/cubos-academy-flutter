class CounterModel {
  var _counter = 0;

  int get counter => _counter;

  modifyCounter(int value, Function(int, int) operation) {
    _counter = operation(_counter, value);
  }
}
