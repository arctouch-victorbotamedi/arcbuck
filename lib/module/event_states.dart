import 'package:arcbuck/data/event.dart';
import 'package:equatable/equatable.dart';


abstract class EventState extends Equatable {
  EventState([List props = const []]) : super(props);
}

class UninitializedState extends EventState {
  @override
  String toString() => 'UninitializedState';
}

class ErrorState extends EventState {
  @override
  String toString() => 'ErrorState';
}

class EventsLoadedState extends EventState {
  final List<Event> events;

  EventsLoadedState(this.events) : super([events]);

  @override
  String toString() => 'EventsLoadedState';
}
