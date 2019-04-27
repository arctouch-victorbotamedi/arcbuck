import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SmoothShadowCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final double height;

  SmoothShadowCard({this.child, this.margin, this.height});

  @override
  Widget build(BuildContext context) {
    var cardColor = Theme.of(context).cardColor;
    return Container(
      margin: margin ?? EdgeInsets.all(4),
      width: double.infinity,
      height: height,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: child,
      ),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 15.0,
            ),
          ]
      ),
    );
  }
}