part of 'post_project_evaluation_cubit.dart';

@immutable
abstract class PostProjectEvaluationState {}

class PostProjectEvaluationInitial extends PostProjectEvaluationState {}
class UserPostProjectEvaluationLoadingState extends PostProjectEvaluationState {}
class UserPostProjectEvaluationSuccessState extends PostProjectEvaluationState {
  EvaluationResponseModel model;
  UserPostProjectEvaluationSuccessState(this.model);
}
class UserPostProjectEvaluationErrorState extends PostProjectEvaluationState {
  final String errMessage;
  UserPostProjectEvaluationErrorState(this.errMessage);
}
