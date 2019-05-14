import 'package:arcbuck/data/event.dart';
import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_states.dart';
import 'package:arcbuck/view/resources/theme_colors.dart';
import 'package:arcbuck/view/widget/animated_available_budget_card.dart';
import 'package:arcbuck/view/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeSliver extends StatefulWidget {
  @override
  State<HomeSliver> createState() => _HomeSliverState();
}

class _HomeSliverState extends State<HomeSliver> {
  final controller = ScrollController();
  static const double appBarHeight = 226;
  static const double minimumAppBarHeight = 118;

  @override
  Widget build(BuildContext context) =>
      _buildEventsContainerWidget(context, Theme.of(context));


  Widget _buildEventsContainerWidget(BuildContext context, ThemeData theme) {
    var bloc = BlocProvider.of<EventBloc>(context);
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          switch (state.runtimeType) {
          //case UninitializedState:
          //  return _buildUninitilazedList();
            case EventsLoadedState:
              return _buildEventListWidget(_eventsToRenderItems(state.events));
            default:
              return Center(child: Text('Failed to fetch'));
          }
        }
    );
  }

  Widget _buildEventListWidget(List<_EventRenderItem> events) {
    var query = MediaQuery.of(context);
    var statusBarHeight = query.padding.top;
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          pinned: true,
          expandedHeight: appBarHeight,
          floating: false,
          bottom: PreferredSize(                       // Add this code
            preferredSize: Size.fromHeight(minimumAppBarHeight - kToolbarHeight),
            child: SizedBox(),// Add this code
          ),
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var maximumDistance =  appBarHeight - minimumAppBarHeight;
              var currentDistance = (constraints.maxHeight - statusBarHeight)
                  - minimumAppBarHeight;
              var animationPercentage = currentDistance / maximumDistance;

              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: minimumAppBarHeight + statusBarHeight,
                    decoration: BoxDecoration(
                        gradient: ThemeColors.primaryGradient
                    ),
                    child: Center(
                      child: RichText(
                        strutStyle: StrutStyle(
                            fontSize: 24
                        ),
                        text: TextSpan(
                            text: 'April’s ',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'Budget',
                                  style: new TextStyle(fontSize: 24, fontWeight: FontWeight.normal))
                            ]
                        ),
                      ),
                    ),
                  ),
                  AnimatedAvailableBudgetCard(
                    height: 167,
                    animationPercentage: animationPercentage,
                  )
                ],
              );
            },
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              print('item $index');
              if (index >= events.length)
                return null;

              return EventListItem(
                  events[index].event, header: events[index].header);

            }
            )
        )
      ],
    );
  }

  List<_EventRenderItem> _eventsToRenderItems(List<Event> events) {
    if (events.isEmpty)
      return [];

    var renderItems = [_EventRenderItem(events.first, header: "This week")];
    var initialWeek = _weekNumber(events.first.date);
    var currentWeek = initialWeek;
    var allHeadersIncluded = false;
    var firstWeekIncluded = false;
    for (int i = 1; i < events.length; i++) {
      String header;
      var weekDifference = _weekNumber(events[i].date) - currentWeek;
      if (!allHeadersIncluded && weekDifference > 0 && weekDifference <= 2) {
        if (weekDifference == 1 && !firstWeekIncluded) {
          header = "Next week";
          firstWeekIncluded = true;
        }
        else {
          if (weekDifference == 2 && !allHeadersIncluded) {
            header = "Upcoming";
            allHeadersIncluded = true;
          }
        }
      }
      renderItems.add(_EventRenderItem(events[i], header: header));
      currentWeek = _weekNumber(events.first.date);
    }

    return renderItems;
  }

  int _weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}

class _EventRenderItem {
  final Event event;
  final String header;

  _EventRenderItem(this.event, {this.header=null});
}
