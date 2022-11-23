import 'package:flutter/material.dart';

class MatrixScreen extends StatefulWidget {
  MatrixScreen({Key? key}) : super(key: key);

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> translateAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 30);

    /* final CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut); */

    translateAnimation =
        Tween(begin: 0.0, end: 10.0).animate(animationController);
    animation = Tween(begin: 30.0, end: 80.0).animate(animationController);
    animation.addListener(() {
      setState(() {
        //
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Augmented'),
          SizedBox(
            height: 100,
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Center(
              child: GestureDetector(
                onTapDown: (details) {
                  animationController.forward();
                },
                onTapUp: (details) {
                  animationController.reverse();
                },
                child: Container(
                  width: animation.value,
                  height: animation.value,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
