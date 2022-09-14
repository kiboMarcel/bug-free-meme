import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _RotateSliderScreen();
}

class _RotateSliderScreen extends State<SliderScreen> {
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
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 7.0,
                  pressedElevation: 2.0,
                ),
              ),
              child: Slider(
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                min: 0,
                max: 100,
              ),
            ),
            CupertinoSlider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
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
