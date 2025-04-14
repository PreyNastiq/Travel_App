import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: 80,
      floating: true,
      backgroundColor: Colors.blue.shade400,
      centerTitle: true,
      title: title,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),
    );
  }
}
