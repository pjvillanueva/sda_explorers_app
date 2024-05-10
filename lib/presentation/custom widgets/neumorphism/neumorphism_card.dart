// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NeumorphicCard extends StatelessWidget {
  NeumorphicCard({this.height, this.width, this.child});

  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              blurRadius: 30.0,
              offset: Offset(-28, -28),
              color: Colors.white,
            ),
            BoxShadow(
                blurRadius: 30.0,
                offset: Offset(20, 28),
                color: Color(0xFFA7A9AF))
          ]),
      child: SizedBox(
        height: height ?? 200,
        width: width ?? 200,
        child: child,
      ),
    );
  }
}
