
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/sessions_model.dart';
import '../../../data/models/specific_session_model.dart';
import '../../../data/repos/sessions_repo/sessions_repo.dart';

part 'specific_sessions_state.dart';

class SpecificSessionsCubit extends Cubit<SpecificSessionsState> {
  SpecificSessionsCubit(this.sessionsRepo) : super(SpecificSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> specificSessionsDetails({required int id}) async {
    emit(UserSpecificSessionsLoadingState());
    var result = await sessionsRepo!.getSpecificSession(id: id);
    return result.fold((failure) {
      emit(UserSpecificSessionsErrorState(failure.errMessage));
    }, (data) {
      emit(UserSpecificSessionsSuccessState(data));
    });
  }
}
