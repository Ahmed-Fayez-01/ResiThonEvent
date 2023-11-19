
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/features/user/projects/data/models/evaluation_responce_model.dart';
import '../../../data/models/session_evaluation_responce_model.dart';
import '../../../data/repos/sessions_repo/sessions_repo.dart';
part 'post_session_evaluation_state.dart';

class PostSessionEvaluationCubit extends Cubit<PostSessionEvaluationState> {
  PostSessionEvaluationCubit(this.sessionsRepo) : super(PostSessionEvaluationInitial());
  SessionsRepo? sessionsRepo;
  Future<void> postSessionEvaluationDetails({required var data}) async {
    emit(UserPostSessionEvaluationLoadingState());
    var result = await sessionsRepo!.postSessionsEvaluations(data: data);
    return result.fold((failure) {
      emit(UserPostSessionEvaluationErrorState(failure.errMessage));
    }, (data)  {
      emit(UserPostSessionEvaluationSuccessState(data));
    });
  }
}
