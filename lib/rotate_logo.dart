import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class RotateLogoScreen extends StatefulWidget {
  const RotateLogoScreen({super.key});

  @override
  State<RotateLogoScreen> createState() => _RotateLogoScreenState();
}

class _RotateLogoScreenState extends State<RotateLogoScreen>
    with TickerProviderStateMixin {
  /* late AnimationController _animationController;
  late Animation<double> animation; */
  late ScrollController _scrollController;

  final double initialImageRotationAngle = 0;
  late ValueNotifier<double> imageRotationAngleNotifier;

  void scrollListener() {
    ScrollDirection scrollDirection =
        _scrollController.position.userScrollDirection;
    double scrollPosition = _scrollController.position.pixels.abs();
    print(scrollPosition);
    if (scrollDirection == ScrollDirection.forward) {
      imageRotationAngleNotifier.value += scrollPosition * 0.01 * math.pi / 180;
    } else {
      //print(scrollPosition);
      imageRotationAngleNotifier.value -= scrollPosition * 0.01 * math.pi / 180;
    }
  }

  @override
  void initState() {
    /* _animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 3000),
    );

    animation = Tween(begin: 0.0, end: 100.0).animate(_animationController);

    _animationController.forward(); */

    _scrollController = ScrollController()..addListener(scrollListener);

    imageRotationAngleNotifier =
        ValueNotifier<double>(initialImageRotationAngle);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              color: Color(0xFF09A777),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: ValueListenableBuilder(
                valueListenable: imageRotationAngleNotifier,
                builder: (context, double imageRotationAngle, child) {
                  return Transform.rotate(
                    angle: imageRotationAngleNotifier.value,
                    child: Icon(
                      Icons.circle_notifications,
                      color: Colors.white,
                      size: 80,
                    ),
                  );
                }
                /* child: Icon(
                Icons.timelapse,
                color: Colors.white,
                size: 80,
              ), */
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView(
            controller: _scrollController,
            children: [
              for (var i = 0; i < 100; i++)
                ListTile(
                  title: Text('item $i'),
                  onTap: () {
                    print(math.pi);
                  },
                )
            ],
          ))
        ],
      ),
    );
  }
}
