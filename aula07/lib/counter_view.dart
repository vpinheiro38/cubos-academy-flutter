import 'package:flutter/material.dart';
import 'counter_controller.dart';

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  var controller = CounterController();

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
            controller.getCounter(),
            style: TextStyle(fontSize: 34),
          ))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatButton(Icons.add, () {
            _onPressFloatButton(controller.incrementCounter);
          }),
          FloatButton(Icons.remove, () {
            _onPressFloatButton(controller.decrementCounter);
          })
        ],
      ),
    );
  }

  _onPressFloatButton(Function operation) {
    setState(() {
      operation();
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
