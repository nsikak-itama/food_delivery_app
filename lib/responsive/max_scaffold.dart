import 'package:flutter/material.dart';

class MaxScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  const MaxScaffold({
    super.key, 
    required this.body, 
    this.appBar, 
    this.drawer
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600
          ),
          child: body,
        ),
      ),
    );
  }
}