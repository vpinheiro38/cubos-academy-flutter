import 'package:flutter/material.dart';
import 'number_controller.dart';

class NumberApp extends StatefulWidget {
  @override
  _NumberAppState createState() => _NumberAppState();
}

class _NumberAppState extends State<NumberApp> {
  var controller = NumberController();

  @override
  void initState() {
    controller.generateNumber();

    super.initState();
  }

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
            "Número: ${controller.getNumber()}",
            style: TextStyle(fontSize: 24),
          )),
          Center(
              child: Text(
            controller.getNumberParity(),
            style: TextStyle(fontSize: 34),
          )),
          RaisedButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  controller.generateNumber();
                });
              })
        ],
      ),
    );
  }
}
