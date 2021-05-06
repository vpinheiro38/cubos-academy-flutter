import 'package:aula14/button.dart';
import 'package:aula14/fourth_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    final Color backgroundColor = (arguments == null) ? Colors.black : arguments as Color;

    return Scaffold(
        appBar: AppBar(title: Text('Terceira Tela')),
        body: Container(
          alignment: Alignment.center,
          color: backgroundColor,
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button('Voltar', () {
                  Navigator.pop(context);
                }),
                Button('Ir para tela 4', () {
                  Navigator.popAndPushNamed(context, 'fourth', arguments: FourthParams('Victor', 22));
                })
              ]),
        )
    );
  }

}