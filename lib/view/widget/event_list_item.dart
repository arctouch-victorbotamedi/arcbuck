import 'package:arcbuck/data/event.dart';
import 'package:arcbuck/view/widget/smooth_shadow_card.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  final Event _event;

  EventListItem(this._event);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SmoothShadowCard(
      child:
        Container(
          height: 78,
          child: Column(
              children: [
                Text(_event.name)
              ],
        ),
      ),
    );
  }
}