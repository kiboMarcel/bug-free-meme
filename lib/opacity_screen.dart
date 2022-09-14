import 'package:flutter/material.dart';

class OpacityScreen extends StatefulWidget {
  const OpacityScreen({Key? key}) : super(key: key);

  @override
  State<OpacityScreen> createState() => _OpacityScreenState();
}

class _OpacityScreenState extends State<OpacityScreen> {
  late bool _visible;

  @override
  void initState() {
    _visible = false;
    super.initState();
  }

  toggleVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: _visible ? 0.1 : 0.2,
              child: Text('can see me '),
            ),
            TextButton(
              onPressed: () {
                toggleVisible();
              },
              child: Text('toggle opacity'),
            )
          ],
        ),
      ),
    );
  }
}
