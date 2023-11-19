part of 'specific_sessions_cubit.dart';

@immutable
abstract class SpecificSessionsState {}

class SpecificSessionsInitial extends SpecificSessionsState {}
class UserSpecificSessionsLoadingState extends SpecificSessionsState {}
class UserSpecificSessionsSuccessState extends SpecificSessionsState {
  SpecificSessionModel model;
  UserSpecificSessionsSuccessState(this.model);
}
class UserSpecificSessionsErrorState extends SpecificSessionsState {
  final String errMessage;
  UserSpecificSessionsErrorState(this.errMessage);
}
