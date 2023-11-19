
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/user/projects/data/models/evaluation_responce_model.dart';
import 'package:resithon_event/features/user/projects/data/models/project_model.dart';
import 'package:resithon_event/features/user/projects/data/repos/project_reop/projects_repo.dart';

import '../../../data/models/evaluation_project_model.dart';
part 'post_project_evaluation_state.dart';

class PostProjectEvaluationCubit extends Cubit<PostProjectEvaluationState> {
  PostProjectEvaluationCubit(this.projectsRepo) : super(PostProjectEvaluationInitial());
  ProjectsRepo? projectsRepo;
  Future<void> postProjectEvaluationDetails({required var data}) async {
    emit(UserPostProjectEvaluationLoadingState());
    var result = await projectsRepo!.postProjectEvaluations(data: data);
    return result.fold((failure) {
      emit(UserPostProjectEvaluationErrorState(failure.errMessage));
    }, (data)  {
      emit(UserPostProjectEvaluationSuccessState(data));
    });
  }
}
