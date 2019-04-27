import 'package:arcbuck/data/event.dart';

class EventRepository {
  Future<List<Event>> fetch(int page) async {
    var mockEvents = [
      Event(
          name: "Churras na lage",
          location: "Oberdan's place",
          date: DateTime.now(),
          category: EventCategory.food),
      Event(
          name: "Nipozin",
          location: "Nipô",
          date: DateTime.now().add(Duration(days: 1)),
          category: EventCategory.food),
      Event(
          name: "Design team lunch",
          location: "Ney",
          date: DateTime.now().add(Duration(days: 4)),
          category: EventCategory.food),
      Event(
          name: "Paintball",
          location: "Cacupe",
          date: DateTime.now().add(Duration(days: 6)),
          category: EventCategory.sport),
      Event(
          name: "Soccer",
          location: "Show de bola",
          date: DateTime.now().add(Duration(days: 11)),
          category: EventCategory.sport),
      Event(
          name: "Xamarin Pizza Night",
          location: "ArcTouch",
          date: DateTime.now().add(Duration(days: 14)),
          category: EventCategory.food),
      Event(
          name: "Luxury Card team lunch",
          location: "Ubaia",
          date: DateTime.now().add(Duration(days: 18)),
          category: EventCategory.food),
      Event(
          name: "AT Kart Grand Prix",
          location: "Continente Park Shopping",
          date: DateTime.now().add(Duration(days: 20)),
          category: EventCategory.sport),
    ];
    return mockEvents;
  }
}
