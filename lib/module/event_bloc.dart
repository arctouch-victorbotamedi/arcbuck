import 'package:bloc/bloc.dart';
import 'package:arcbuck/module/event_events.dart';
import 'package:arcbuck/module/event_states.dart';

class EventBloc extends Bloc<EventBlocEvent, EventState> {

  @override
  EventState get initialState => UninitializedState();

  @override
  Stream<EventState> mapEventToState(EventBlocEvent event) async* {
    yield initialState;
  }
}
