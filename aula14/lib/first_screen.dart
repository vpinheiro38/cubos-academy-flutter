import 'package:aula14/button.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primeira Tela')),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button('Voltar', () {
                  Navigator.pop(context);
                }),
                Button('Ir para tela 2', () {
                  Navigator.pushNamed(context, 'second');
                }),
                Button('Ir para tela 3', () {
                  Navigator.pushNamed(context, 'third');
                })
              ]),
        )
    );
  }
}