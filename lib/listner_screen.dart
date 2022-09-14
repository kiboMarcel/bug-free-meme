import 'package:flutter/material.dart';

class ListnerScreen extends StatefulWidget {
  const ListnerScreen({super.key});

  @override
  State<ListnerScreen> createState() => _ListnerScreenState();
}

class _ListnerScreenState extends State<ListnerScreen>
    with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);

    animation = Tween(begin: 0.0, end: 300).animate(curve);
    animationController.forward();
    animation.addStatusListener(listener);

    super.initState();
  }

  void listener(AnimationStatus status) {
    print('-------- $status');
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  Widget builder(BuildContext context, Widget? child) {
    return Container(
      height: animation.value.toDouble(),
      width: animation.value.toDouble(),
      child: FlutterLogo(),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(animation: animation, builder: builder)),
    );
  }
}
