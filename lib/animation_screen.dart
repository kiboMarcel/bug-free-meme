import 'package:flutter/material.dart';

class AnimationBuildScreen extends StatefulWidget {
  const AnimationBuildScreen({Key? key}) : super(key: key);

  @override
  State<AnimationBuildScreen> createState() => _AnimationBuildScreenState();
}

class _AnimationBuildScreenState extends State<AnimationBuildScreen>
    with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    final CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

    animation = Tween(begin: 0.0, end: 300).animate(curve);

    animationController.forward();
    super.initState();
  }

  Widget builder(BuildContext context, Widget? child) {
    return Container(
      height: animation.value.toDouble(),
      width: animation.value.toDouble(),
      child: FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(animation: animation, builder: builder)),
    );
  }
}
