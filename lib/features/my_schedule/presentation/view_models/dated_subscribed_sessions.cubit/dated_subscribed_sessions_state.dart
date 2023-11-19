part of 'dated_subscribed_sessions_cubit.dart';

@immutable
abstract class DatedSubscribedSessionsState {}

class DatedSubscribedSessionsInitial extends DatedSubscribedSessionsState {}
class UserDatedSubscribedSessionsLoadingState extends DatedSubscribedSessionsState {}
class UserDatedSubscribedSessionsSuccessState extends DatedSubscribedSessionsState {
  SessionsModel model;
  UserDatedSubscribedSessionsSuccessState(this.model);
}
class UserDatedSubscribedSessionsErrorState extends DatedSubscribedSessionsState {
  final String errMessage;
  UserDatedSubscribedSessionsErrorState(this.errMessage);
}
