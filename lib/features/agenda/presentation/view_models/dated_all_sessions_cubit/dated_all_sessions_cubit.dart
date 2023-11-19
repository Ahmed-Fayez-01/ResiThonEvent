
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../sessions/data/models/sessions_model.dart';
import '../../../../sessions/data/repos/sessions_repo/sessions_repo.dart';

part 'dated_all_sessions_state.dart';

class DatedAllSessionsCubit extends Cubit<DatedAllSessionsState> {
  DatedAllSessionsCubit(this.sessionsRepo) : super(DatedAllSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> datedAllSessionsDetails({Map<String,dynamic>? query}) async {
    emit(UserDatedAllSessionsLoadingState());
    var result = await sessionsRepo!.getAllSessions(query: query);
    return result.fold((failure) {
      emit(UserDatedAllSessionsErrorState(failure.errMessage));
    }, (data) {
      emit(UserDatedAllSessionsSuccessState(data));
    });
  }
}
