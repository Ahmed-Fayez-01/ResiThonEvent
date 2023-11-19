part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}
class UserEventLoadingState extends EventState {}
class UserEventSuccessState extends EventState {
  EventModel model;
  UserEventSuccessState(this.model);
}
class UserEventErrorState extends EventState {
  final String errMessage;
  UserEventErrorState(this.errMessage);
}
