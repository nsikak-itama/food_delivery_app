import 'package:flutter/material.dart';

class MaxScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Color backGroundColor;
  const MaxScaffold({
    super.key, 
    required this.body, 
    this.appBar, 
    this.drawer, 
    required this.backGroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: appBar,
      drawer: drawer,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500
          ),
          child: body,
        ),
      ),
    );
  }
}