import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_states.dart';
import 'package:arcbuck/view/resources/theme_colors.dart';
import 'package:arcbuck/view/widget/animated_available_budget_card.dart';
import 'package:arcbuck/view/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return _buildEventListWidget(bloc, state);
            default:
              return Center(child: Text('Failed to fetch'));
          }
        }
    );
  }

  Widget _buildEventListWidget(EventBloc bloc, EventsLoadedState state) {
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
              if (index >= state.events.length)
                return null;
              return EventListItem(state.events[index]);
            }
            )
        )
      ],
    );
  }
}
