class Event {

  String name;

  String location;

  DateTime date;

  EventCategory category;

  Event({this.name, this.location, this.date, this.category});
}

enum EventCategory
{
  food,
  sport
}
