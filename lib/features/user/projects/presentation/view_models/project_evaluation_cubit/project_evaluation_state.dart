part of 'project_evaluation_cubit.dart';

@immutable
abstract class ProjectEvaluationState {}

class ProjectEvaluationInitial extends ProjectEvaluationState {}
class UserProjectEvaluationLoadingState extends ProjectEvaluationState {}
class UserProjectEvaluationSuccessState extends ProjectEvaluationState {
  EvaluationProjectModel model;
  UserProjectEvaluationSuccessState(this.model);
}
class UserProjectEvaluationErrorState extends ProjectEvaluationState {
  final String errMessage;
  UserProjectEvaluationErrorState(this.errMessage);
}
