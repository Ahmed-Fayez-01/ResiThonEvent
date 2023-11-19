part of 'dated_all_sessions_cubit.dart';

@immutable
abstract class DatedAllSessionsState {}

class DatedAllSessionsInitial extends DatedAllSessionsState {}
class UserDatedAllSessionsLoadingState extends DatedAllSessionsState {}
class UserDatedAllSessionsSuccessState extends DatedAllSessionsState {
  SessionsModel model;
  UserDatedAllSessionsSuccessState(this.model);
}
class UserDatedAllSessionsErrorState extends DatedAllSessionsState {
  final String errMessage;
  UserDatedAllSessionsErrorState(this.errMessage);
}
