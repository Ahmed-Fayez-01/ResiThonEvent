part of 'all_projects_cubit.dart';

@immutable
abstract class AllProjectsState {}

class AllProjectsInitial extends AllProjectsState {}
class UserAllProjectsLoadingState extends AllProjectsState {}
class UserAllProjectsSuccessState extends AllProjectsState {
  ProjectModel model;
  UserAllProjectsSuccessState(this.model);
}
class UserAllProjectsErrorState extends AllProjectsState {
  final String errMessage;
  UserAllProjectsErrorState(this.errMessage);
}
