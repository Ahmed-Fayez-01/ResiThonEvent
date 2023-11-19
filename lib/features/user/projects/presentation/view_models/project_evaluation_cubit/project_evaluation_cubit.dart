
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/user/projects/data/models/project_model.dart';
import 'package:resithon_event/features/user/projects/data/repos/project_reop/projects_repo.dart';

import '../../../data/models/evaluation_project_model.dart';
part 'project_evaluation_state.dart';

class ProjectEvaluationCubit extends Cubit<ProjectEvaluationState> {
  ProjectEvaluationCubit(this.projectsRepo) : super(ProjectEvaluationInitial());
  ProjectsRepo? projectsRepo;
  Future<void> projectEvaluationDetails() async {
    emit(UserProjectEvaluationLoadingState());
    var result = await projectsRepo!.getProjectEvaluations();
    return result.fold((failure) {
      emit(UserProjectEvaluationErrorState(failure.errMessage));
    }, (data)  {
      emit(UserProjectEvaluationSuccessState(data));
    });
  }
}
