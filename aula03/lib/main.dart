import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 03 Exercise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [WhiteContainer(), WhiteContainer(), WhiteContainer()],
          ),
        ),
        Container(
          color: Colors.blue,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowContainer(Colors.green),
              RowContainer(Colors.red),
              RowContainer(Colors.yellow)
            ],
          ),
        )
      ],
    );
  }
}

class WhiteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(40),
      color: Colors.white,
    );
  }
}

class RowContainer extends StatelessWidget {
  final Color _color;

  RowContainer(this._color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: _color,
    );
  }
}
