import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_states.dart';
import 'package:arcbuck/view/resources/styles.dart';
import 'package:arcbuck/view/widget/available_budget_card.dart';
import 'package:arcbuck/view/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavMenu { home, settings }

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollThresholdPercentage = 70;
  int _count = 0;
  BottomNavMenu _selectedItem = BottomNavMenu.home;

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('April Budget'),
      ),
      body: _buildBody(context, theme),
      bottomNavigationBar: _buildBottomNavigation(context),
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

  Widget _buildHeaderWidget(BuildContext context, ThemeData theme) {
    var query = MediaQuery.of(context);
    var statusBarHeight = query.padding.top;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 118 + statusBarHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [const Color(0xffff8300), const Color(0xFFe8670a)])
          ),
        ),
        AvailableBudgetCard(
          height: 167,
          padding: EdgeInsets.only(left: 16, right: 16, top: 67 + statusBarHeight),
        )
      ],
    );
  }

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
          color: Theme
              .of(context)
              .accentColor
              .withAlpha(25),
          width: 8.0,
        ),
      ),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        fillColor: Theme
            .of(context)
            .accentColor,
        child: Icon(
            Icons.add
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    var accentColor = Theme
        .of(context)
        .accentColor;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            Styles.shadowStyle
          ]
      ),
      child: BottomAppBar(
        child: Container(
            height: 46.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildBottomNavigationItems(context)
            )
        ),
      ),
    );
  }

  Widget _buildSettingsIcon(BuildContext context)
  {
    var accentColor = Theme
        .of(context)
        .accentColor;

    var color = _selectedItem == BottomNavMenu.settings ? accentColor : Colors.grey;

    return IconButton(icon: Icon(Icons.settings), color: color, onPressed: _onSettingsPressed);
  }

  Widget _buildHomeIcon(BuildContext context)
  {
    var accentColor = Theme
        .of(context)
        .accentColor;

    var color = _selectedItem == BottomNavMenu.home ? accentColor : Colors.grey;

    return IconButton(icon: Icon(Icons.home), color:  color, onPressed: _onHomePressed);
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {

    switch (_selectedItem)
    {
      case BottomNavMenu.home:
        return _buildCenterWidget(context, theme);
      case BottomNavMenu.settings:
        return Text("Settings");
    }
  }

  List<Widget> _buildBottomNavigationItems(BuildContext context) {
    return [
      _buildHomeIcon(context),
      _buildSettingsIcon(context)
    ];
  }

  void _onHomePressed() {
    setState(() {
      _selectedItem = BottomNavMenu.home;
    });
  }

  void _onSettingsPressed() {
    setState(() {
      _selectedItem = BottomNavMenu.settings;
    });
  }
}
