
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../sessions/data/models/sessions_model.dart';
import '../../../../sessions/data/repos/sessions_repo/sessions_repo.dart';

part 'dated_subscribed_sessions_state.dart';

class DatedSubscribedSessionsCubit extends Cubit<DatedSubscribedSessionsState> {
  DatedSubscribedSessionsCubit(this.sessionsRepo) : super(DatedSubscribedSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> datedSubscribedSessionsDetails({Map<String,dynamic>? query}) async {
    emit(UserDatedSubscribedSessionsLoadingState());
    var result = await sessionsRepo!.getSubscribedSessions(query: query);
    return result.fold((failure) {
      emit(UserDatedSubscribedSessionsErrorState(failure.errMessage));
    }, (data) {
      emit(UserDatedSubscribedSessionsSuccessState(data));
    });
  }
}
