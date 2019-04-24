import 'package:arcbuck/module/event_bloc.dart';
import 'package:arcbuck/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {

  final EventBloc eventBloc;

  App(this.eventBloc);

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<EventBloc>(bloc: eventBloc),
        ],
        child: new MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(
            primaryColor: Color.fromARGB(255, 219, 48, 100),
            accentColor: Color.fromARGB(255, 249, 159, 0),
            backgroundColor: Color.fromARGB(255, 248, 248, 248),
            scaffoldBackgroundColor: Color.fromARGB(255, 248, 248, 248),
          ),
          home: new HomeView(),
        )
    );
  }
}
