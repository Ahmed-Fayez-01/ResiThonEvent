
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/sessions_model.dart';
import '../../../data/repos/sessions_repo/sessions_repo.dart';

part 'all_sessions_state.dart';

class AllSessionsCubit extends Cubit<AllSessionsState> {
  AllSessionsCubit(this.sessionsRepo) : super(AllSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> sessionsDetails({Map<String,dynamic>? query}) async {
    emit(UserAllSessionsLoadingState());
    var result = await sessionsRepo!.getAllSessions(query: query);
    return result.fold((failure) {
      emit(UserAllSessionsErrorState(failure.errMessage));
    }, (data) {
      emit(UserAllSessionsSuccessState(data));
    });
  }
}
