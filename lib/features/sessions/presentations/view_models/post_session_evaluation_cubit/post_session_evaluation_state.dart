part of 'post_session_evaluation_cubit.dart';

@immutable
abstract class PostSessionEvaluationState {}

class PostSessionEvaluationInitial extends PostSessionEvaluationState {}
class UserPostSessionEvaluationLoadingState extends PostSessionEvaluationState {}
class UserPostSessionEvaluationSuccessState extends PostSessionEvaluationState {
  SessionEvaluationResponseModel model;
  UserPostSessionEvaluationSuccessState(this.model);
}
class UserPostSessionEvaluationErrorState extends PostSessionEvaluationState {
  final String errMessage;
  UserPostSessionEvaluationErrorState(this.errMessage);
}
