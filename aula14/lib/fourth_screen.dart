import 'package:aula14/button.dart';
import 'package:flutter/material.dart';

class FourthParams {
  final String _name;
  final int _age;

  FourthParams(this._name, this._age);
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;

    final FourthParams fourthParams =
      (arguments == null)
          ? FourthParams('Nenhum nome foi recebido', 0)
          : arguments as FourthParams;

    return Scaffold(
        appBar: AppBar(title: Text('Quarta Tela')),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Text('Nome: ${fourthParams._name}\nIdade: ${fourthParams._age}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Button('Voltar', () {
                  Navigator.pop(context);
                }),
                Button('Voltar para tela home', () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                })
              ]),
        )
    );
  }
}