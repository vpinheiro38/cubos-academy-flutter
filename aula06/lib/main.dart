import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CounterApp(),
  ));
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Aplicativo Contador')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "O valor atual do contador é:",
            style: TextStyle(fontSize: 24),
          )),
          Center(
              child: Text(
            "$_counter",
            style: TextStyle(fontSize: 34),
          ))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatButton(Icons.add, () {
            _onPressFloatButton(_incrementCounter);
          }),
          FloatButton(Icons.remove, () {
            _onPressFloatButton(_decrementCounter);
          })
        ],
      ),
    );
  }

  _onPressFloatButton(Function operation) {
    operation();
  }

  _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  _decrementCounter() {
    setState(() {
      _counter -= 1;
    });
  }
}

class FloatButton extends StatelessWidget {
  final IconData _icon;
  final Function _onPressed;

  FloatButton(this._icon, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      child: Icon(_icon),
    );
  }
}
