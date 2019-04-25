import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_states.dart';
import 'package:arcbuck/view/widget/available_budget_card.dart';
import 'package:arcbuck/view/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollThresholdPercentage = 70;
  int _count = 0;

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mainColor = theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('April Budget'),
      ),
      body: _buildCenterWidget(context, theme),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: _buildFloatActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCenterWidget(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        _buildHeaderWidget(context, theme),
        _buildEventsContainerWidget(context, theme)
      ],
    );
  }

  Widget _buildHeaderWidget(BuildContext context, ThemeData theme) =>
    Stack(
      children: [
        Container(
          width: double.infinity,
          color: theme.primaryColor,
          height: 64,
        ),
        AvailableBudgetCard(
          height: 167,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        )
      ],
    );


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

  Widget _buildEventListWidget(EventBloc bloc, EventsLoadedState state) =>
    Flexible(
        child: ListView.builder(
          itemCount: state.events.length,
          itemBuilder: (context, index) {
            //var currentPercentage =  (index * 100) / state.movies.length;
            //if (currentPercentage >= _scrollThresholdPercentage) {
            //  bloc.dispatch(Fetch());
            //}
            return EventListItem(state.events[index]);
          },
        )
    );

  Widget _buildFloatActionButton(BuildContext context) {
    return Container(
      width: 72.0,
      height: 72.0,
      margin: const EdgeInsets.only(top: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Theme.of(context).accentColor.withAlpha(25),
          width: 8.0,
        ),
      ),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        fillColor: Theme.of(context).accentColor,
        child: Icon(
            Icons.add
        ),
        onPressed: (){},
      ),
    );
  }
}
