import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_events.dart';
import 'package:arcbuck/view/home_view.dart';
import 'package:arcbuck/view/resources/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {

  final EventBloc eventBloc;

  App(this.eventBloc) {
    eventBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<EventBloc>(bloc: eventBloc),
        ],
        child: new MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(
            primaryColor: ThemeColors.accent,
            accentColor: ThemeColors.accent,
            backgroundColor: ThemeColors.backgroundColor,
            scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
            cardColor: ThemeColors.white,
            bottomAppBarTheme: BottomAppBarTheme(color: ThemeColors.white, elevation: 0.0),
            iconTheme: IconThemeData(color: ThemeColors.white),
            primaryTextTheme: TextTheme(title: TextStyle(color: ThemeColors.white)),
            fontFamily: "Avenir"
          ),
          home: new HomeView(),
        )
    );
  }
}
