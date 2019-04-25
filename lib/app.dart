import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/module/event_events.dart';
import 'package:arcbuck/view/home_view.dart';
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
            primaryColor: Color.fromARGB(255, 255, 131, 0),
            accentColor: Color.fromARGB(255, 255, 131, 0),
            backgroundColor: Color.fromARGB(255, 238, 243, 252),
            scaffoldBackgroundColor: Color.fromARGB(255, 238, 243, 252),
            primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))
          ),
          home: new HomeView(),
        )
    );
  }
}
