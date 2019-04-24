import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_states.dart';
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
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: mainColor.withAlpha(25),
                width: 50,
            )
        ),
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
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
    Container(
        width: double.infinity,
        color: theme.primaryColor,
        height: 81,
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
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              //var currentPercentage =  (index * 100) / state.movies.length;
              //if (currentPercentage >= _scrollThresholdPercentage) {
              //  bloc.dispatch(Fetch());
              //}
              return EventListItem(state.events[index]);
            },
          )
      );

}
