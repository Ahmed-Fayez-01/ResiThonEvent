
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/features/sessions/data/models/book_model.dart';

import '../../../data/models/sessions_model.dart';
import '../../../data/repos/sessions_repo/sessions_repo.dart';

part 'cancel_sessions_state.dart';

class CancelSessionsCubit extends Cubit<CancelSessionsState> {
  CancelSessionsCubit(this.sessionsRepo) : super(CancelSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> cancelBookSession({required int id}) async {
    emit(UserCancelSessionsLoadingState());
    var result = await sessionsRepo!.cancelBookSession(id: id);
    return result.fold((failure) {
      emit(UserCancelSessionsErrorState(failure.errMessage));
    }, (data) {
      emit(UserCancelSessionsSuccessState(data));
    });
  }
}
