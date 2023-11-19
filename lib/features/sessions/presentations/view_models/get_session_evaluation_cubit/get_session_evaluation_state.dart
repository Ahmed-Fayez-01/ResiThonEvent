part of 'get_session_evaluation_cubit.dart';

@immutable
abstract class GetSessionEvaluationState {}

class GetSessionEvaluationInitial extends GetSessionEvaluationState {}
class UserGetSessionEvaluationLoadingState extends GetSessionEvaluationState {}
class UserGetSessionEvaluationSuccessState extends GetSessionEvaluationState {
  SessionEvaluationModel model;
  UserGetSessionEvaluationSuccessState(this.model);
}
class UserGetSessionEvaluationErrorState extends GetSessionEvaluationState {
  final String errMessage;
  UserGetSessionEvaluationErrorState(this.errMessage);
}
