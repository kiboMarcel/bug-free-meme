import 'package:flutter/material.dart';

class ChildWrapper extends StatefulWidget {
  final bool keepAlive;
  final Widget child;

  const ChildWrapper({
    Key? key,
    required this.child,
    this.keepAlive = false,
  }) : super(key: key);

  @override
  State<ChildWrapper> createState() => _ChildWrapperState();
}

class _ChildWrapperState extends State<ChildWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  //...
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(); //AnimationWidget();
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
