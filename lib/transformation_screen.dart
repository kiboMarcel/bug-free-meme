import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  TransformScreen({Key? key}) : super(key: key);

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  late double x;
  late double y;
  late double z;

  @override
  void initState() {
    x = 0;
    y = 0;
    z = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('X'),
                  Slider(
                      value: x,
                      onChanged: (double value) {
                        setState(() {
                          x = value;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text('Y'),
                  Slider(
                      value: y,
                      onChanged: (double value) {
                        setState(() {
                          y = value;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text('Z'),
                  Slider(
                      value: z,
                      onChanged: (double value) {
                        setState(() {
                          z = value;
                        });
                      })
                ],
              ),
              Transform(
                transform: Matrix4.skewY(y),
                child: Transform(
                  transform: Matrix4.skewX(x),
                  child: Transform(
                    transform: Matrix4.rotationZ(z),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Hello Word'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
