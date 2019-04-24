import 'package:arcbuck/data/event.dart';

class EventRepository {

  Future<List<Event>> fetch(int page) async {
    var mockEvents = [
      Event("Churras na lage"),
      Event("Futebol de quarta"),
      Event("Basquete de terça"),
      Event("Almocinho Nipo"),
    ];
    return mockEvents;
  }
}
