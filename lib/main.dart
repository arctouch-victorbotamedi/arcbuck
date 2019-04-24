// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'package:arcbuck/app.dart';
import 'package:arcbuck/data/event_repository.dart';
import 'package:arcbuck/module/event_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  var repository = EventRepository();
  var eventBloc = EventBloc(repository);
  runApp(App(eventBloc));
}


