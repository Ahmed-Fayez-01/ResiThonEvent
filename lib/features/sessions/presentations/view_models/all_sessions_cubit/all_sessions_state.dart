part of 'all_sessions_cubit.dart';

@immutable
abstract class AllSessionsState {}

class AllSessionsInitial extends AllSessionsState {}
class UserAllSessionsLoadingState extends AllSessionsState {}
class UserAllSessionsSuccessState extends AllSessionsState {
  SessionsModel model;
  UserAllSessionsSuccessState(this.model);
}
class UserAllSessionsErrorState extends AllSessionsState {
  final String errMessage;
  UserAllSessionsErrorState(this.errMessage);
}
