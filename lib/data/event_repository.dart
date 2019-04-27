import 'package:arcbuck/data/event.dart';

class EventRepository {

  Future<List<Event>> fetch(int page) async {
    var mockEvents = [
      Event(name: "Churras na lage", location: "Lage do Vitinho", date: DateTime.now(), category: EventCategory.food),
      Event(name: "Churras na lage", location: "Lage do Vitinho", date: DateTime.now(), category: EventCategory.food),
      Event(name: "Churras na lage", location: "Lage do Vitinho", date: DateTime.now(), category: EventCategory.sport),
      Event(name: "Churras na lage", location: "Lage do Vitinho", date: DateTime.now(), category: EventCategory.sport),
    ];
    return mockEvents;
  }
}
