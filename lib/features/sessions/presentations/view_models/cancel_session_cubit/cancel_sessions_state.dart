part of 'cancel_sessions_cubit.dart';

@immutable
abstract class CancelSessionsState {}

class CancelSessionsInitial extends CancelSessionsState {}
class UserCancelSessionsLoadingState extends CancelSessionsState {}
class UserCancelSessionsSuccessState extends CancelSessionsState {
  BookModel model;
  UserCancelSessionsSuccessState(this.model);
}
class UserCancelSessionsErrorState extends CancelSessionsState {
  final String errMessage;
  UserCancelSessionsErrorState(this.errMessage);
}
