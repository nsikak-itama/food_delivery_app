import 'package:flutter/material.dart';

class MaxScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Color backGroundColor;
  final bool constrainBody;

  
  const MaxScaffold({
    super.key, 
    required this.body, 
    this.appBar, 
    this.drawer, 
    required this.backGroundColor, 
    this.constrainBody = true
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: appBar,
      drawer: drawer,
      body: constrainBody ? Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500
          ),
          child: body,
        ),
      ) : body,
    );
  }
}