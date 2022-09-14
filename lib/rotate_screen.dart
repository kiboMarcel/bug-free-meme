import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RotateBox extends StatefulWidget {
  RotateBox({Key? key}) : super(key: key);

  @override
  State<RotateBox> createState() => _RotateBoxState();
}

class _RotateBoxState extends State<RotateBox> {
  late int _turn;
  late double _value;

  @override
  void initState() {
    _turn = 0;
    _value = 0;
    super.initState();
  }

  void _onChange(double value) {
    setState(() {
      _value = value;
      _turn = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  _turn = value.toInt();
                });
              },
              min: 0,
              max: 4,
            ),
            RotatedBox(
              quarterTurns: _turn,
              child: Text('Hello'),
            ),
            CupertinoSlider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  _turn = value.toInt();
                });
              },
              min: 0,
              max: 100,
            ),
          ],
        ),
      ),
    );
  }
}
