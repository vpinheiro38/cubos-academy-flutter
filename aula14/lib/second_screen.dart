import 'package:aula14/button.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Segunda Tela')),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button('Ir para tela 3', () {
                  Navigator.pushNamed(context, 'third', arguments: Colors.orange);
                }),
                Button('Ir para tela 4', () {
                  Navigator.pushNamed(context, 'fourth');
                })
              ]),
        )
    );
  }
}