import 'package:arcbuck/data/event_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:arcbuck/module/event_events.dart';
import 'package:arcbuck/module/event_states.dart';

class EventBloc extends Bloc<EventBlocEvent, EventState> {
  final EventRepository eventRepository;

  EventBloc(this.eventRepository);

  @override
  EventState get initialState => UninitializedState();

  @override
  Stream<EventState> mapEventToState(EventBlocEvent event) async* {
    yield initialState;
  }
}
