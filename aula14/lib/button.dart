import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() _onPressed;
  final String _title;

  Button(this._title, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: _onPressed,
                child: Text(
                  _title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
            ),
        )
      ],
    );
  }
}