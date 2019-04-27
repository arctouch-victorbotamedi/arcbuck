import 'package:arcbuck/view/widget/animated_progress_bar.dart';
import 'package:arcbuck/view/widget/smooth_shadow_card.dart';
import 'package:flutter/material.dart';

class AvailableBudgetCard extends StatelessWidget {
  final double height;
  final EdgeInsets padding;
  final BorderRadiusGeometry borderRadius;

  AvailableBudgetCard({this.height, this.padding, this.borderRadius});

  @override
  Widget build(BuildContext context) => SmoothShadowCard(
      height: height,
      margin: padding,
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildHeaderWidget(),
            _buildProgressBar()
          ],
        ),
      )
  );

  Widget _buildHeaderWidget() => Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBudgetValueWidget(),
        Text("Available Budget",
          style: TextStyle(
            color: const Color(0xFF4D4D4D),
            fontSize: 14,
            height: 0.8
          ),
        )
      ],
    )
  );

  Widget _buildBudgetValueWidget() => Stack(
    overflow: Overflow.visible,
    children: [
      Positioned(
          left: -23,
          child: Text("R\$",
            style: TextStyle(
                color: Color(0xffff8300),
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ),
          )
      ),
      Text("2.000",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: const Color(0xFF4D4D4D),
            fontSize: 38,
            fontWeight: FontWeight.bold,
            height: 0.8
        ),
      )
    ],
  );

  Widget _buildProgressBar() => AnimatedProgressBar(
    currentValue: 65,
    size: 24,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [const Color(0xfffd8a11), const Color(0xFFe8670a)]),
      borderRadius: BorderRadius.circular(18),
    ),
    backgroundDecoration: BoxDecoration(
      color: const Color(0xffebebeb),
      borderRadius: BorderRadius.circular(18),
    ),
    animatedDuration: const Duration(milliseconds: 500),
  );
}

