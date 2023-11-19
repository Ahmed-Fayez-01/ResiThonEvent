part of 'subscribed_sessions_cubit.dart';

@immutable
abstract class SubscribedSessionsState {}

class SubscribedSessionsInitial extends SubscribedSessionsState {}
class UserSubscribedSessionsLoadingState extends SubscribedSessionsState {}
class UserSubscribedSessionsSuccessState extends SubscribedSessionsState {
  SessionsModel model;
  UserSubscribedSessionsSuccessState(this.model);
}
class UserSubscribedSessionsErrorState extends SubscribedSessionsState {
  final String errMessage;
  UserSubscribedSessionsErrorState(this.errMessage);
}
