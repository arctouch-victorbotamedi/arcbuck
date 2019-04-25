import 'package:arcbuck/view/widget/smooth_shadow_card.dart';
import 'package:flutter/material.dart';

class AvailableBudgetCard extends StatelessWidget {
  final double height;
  final EdgeInsets padding;

  AvailableBudgetCard({this.height, this.padding});


  @override
  Widget build(BuildContext context) {
    return SmoothShadowCard(
        height: height,
        margin: padding,
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

  Widget _buildHeaderWidget() =>
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBudgetValueWidget(),
            Text("Available Budget",
              style: TextStyle(
                color: Color.fromRGBO(77, 77, 77, 1),
                fontSize: 14,
                height: 0.8
              ),
            )
          ],
        )
      );

  Widget _buildBudgetValueWidget() =>
      Stack(
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
                color: Color.fromRGBO(77, 77, 77, 1),
                fontSize: 38,
                fontWeight: FontWeight.bold,
                height: 0.8
            ),
          )
        ],
      );


  Widget _buildProgressBar() =>
      Container(height: 24, color: Colors.blue);
}

