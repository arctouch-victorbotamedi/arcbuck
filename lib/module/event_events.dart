import 'package:equatable/equatable.dart';

abstract class EventBlocEvent extends Equatable {}

class Fetch extends EventBlocEvent {
  @override
  String toString() => 'Fetch';
}
