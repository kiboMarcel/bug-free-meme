import 'package:flutter/material.dart';

class TweenAScreen extends StatefulWidget {
  TweenAScreen({Key? key}) : super(key: key);

  @override
  State<TweenAScreen> createState() => _TweenAScreenState();
}

class _TweenAScreenState extends State<TweenAScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    animation = Tween(begin: 0.0, end: 400.0).animate(controller);
    animation.addListener(() {
      setState(() {
        //
      });
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}
