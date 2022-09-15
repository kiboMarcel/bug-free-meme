import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RotateLogoScreen extends StatefulWidget {
  const RotateLogoScreen({super.key});

  @override
  State<RotateLogoScreen> createState() => _RotateLogoScreenState();
}

class _RotateLogoScreenState extends State<RotateLogoScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late ScrollController _scrollController;
  late ScrollDirection _scrollDirection;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollDirection == ScrollDirection.forward) {
          _animationController.forward();
          print('forward');
        } else if (_scrollDirection == ScrollDirection.reverse) {
          _animationController.reverse();
          print('reverse');
        }
      });

    super.initState();
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
            child: Transform.rotate(
              angle: animation.value,
              child: Icon(
                Icons.timelapse,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                _scrollDirection = notification.direction;
              });
              return true;
            },
            child: ListView(
              controller: _scrollController,
              children: [
                for (var i = 0; i < 100; i++)
                  ListTile(
                    title: Text('item $i'),
                  )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
