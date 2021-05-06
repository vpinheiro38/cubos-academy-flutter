import 'package:aula14/fourth_screen.dart';
import 'package:aula14/second_screen.dart';
import 'package:aula14/third_screen.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 14 App',
      home: FirstScreen(),
      routes: {
        'second': (context) => SecondScreen(),
        'third': (context) => ThirdScreen(),
        'fourth': (context) => FourthScreen(),
      },
    );
  }
}