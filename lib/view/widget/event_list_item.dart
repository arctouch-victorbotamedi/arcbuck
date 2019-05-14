import 'package:arcbuck/data/event.dart';
import 'package:arcbuck/view/resources/assets.dart';
import 'package:arcbuck/view/resources/styles.dart';
import 'package:arcbuck/view/resources/theme_colors.dart';
import 'package:arcbuck/view/widget/smooth_shadow_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventListItem extends StatelessWidget {
  final Event _event;
  final String header;

  EventListItem(this._event, {this.header});

  @override
  Widget build(BuildContext context) {
    if (header == null) return _eventCardWidget();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 32, bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: ThemeColors.kindaBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ),
        _eventCardWidget()
      ],
    );
  }

  Widget _eventCardWidget() => SmoothShadowCard(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Container(
          height: 124,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_event.date.day.toString(),
                        style: Styles.largeBoldTextStyle),
                    Text(DateFormat('E').format(_event.date),
                        style: Styles.boldTextStyle)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_event.name, style: Styles.primaryTextStyle),
                    Text(_event.location, style: Styles.secondaryTextStyle)
                  ],
                ),
              ),
              Container(
                  width: 64,
                  height: 124,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      gradient: _getCategoryGradient(_event.category)),
                  child: SvgPicture.asset(
                    _getCategoryIcon(_event.category),
                    color: ThemeColors.white,
                    height: 32,
                    width: 32,
                  ))
            ],
          ),
        ),
      );

  LinearGradient _getCategoryGradient(EventCategory category) {
    switch (category) {
      case EventCategory.food:
        return ThemeColors.torchRedGradient;
      case EventCategory.sport:
        return ThemeColors.dodgerBlueGradient;
      default:
        return ThemeColors.slateBlueGradient;
    }
  }

  String _getCategoryIcon(EventCategory category) {
    switch (category) {
      case EventCategory.food:
        return Assets.icFood;
      case EventCategory.sport:
        return Assets.icSport;
      default:
        return Assets.icFood;
    }
  }
}
