import 'package:arcbuck/view/resources/theme_colors.dart';
import 'package:arcbuck/view/widget/animated_progress_bar.dart';
import 'package:arcbuck/view/widget/smooth_shadow_card.dart';
import 'package:flutter/material.dart';

class AnimatedAvailableBudgetCard extends StatelessWidget {
  final double height;
  final double animationPercentage;


  AnimatedAvailableBudgetCard({
    this.height,
    this.animationPercentage=1.0
  });

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var statusBarHeight = query.padding.top;
    return SmoothShadowCard(
        height: height,
        margin: EdgeInsets.only(
            left: animateValue(16),
            right: animateValue(16),
            top: animateValue(67 + statusBarHeight)
        ),
        borderRadius: BorderRadius.circular(animateValue(8)),
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
  }

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
    size: animateValue(24, minimum: 8),
    decoration: BoxDecoration(
      gradient: ThemeColors.progressBarGradient,
      borderRadius: BorderRadius.circular(18),
    ),
    backgroundDecoration: BoxDecoration(
      color: const Color(0xffebebeb),
      borderRadius: BorderRadius.circular(18),
    ),
    animatedDuration: const Duration(milliseconds: 500),
  );

  double animateValue(double value, {double minimum}) {
    minimum = minimum ?? double.negativeInfinity;
    var currentFrameValue = value * animationPercentage;
    return currentFrameValue >= minimum ?
        currentFrameValue : minimum;
  }
}

