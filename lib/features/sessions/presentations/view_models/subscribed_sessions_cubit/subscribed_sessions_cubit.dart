
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/sessions_model.dart';
import '../../../data/repos/sessions_repo/sessions_repo.dart';
part 'subscribed_sessions_state.dart';

class SubscribedSessionsCubit extends Cubit<SubscribedSessionsState> {
  SubscribedSessionsCubit(this.sessionsRepo) : super(SubscribedSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> subscribedSessionsDetails() async {
    emit(UserSubscribedSessionsLoadingState());
    print("mostafa");
    var result = await sessionsRepo!.getSubscribedSessions();
    return result.fold((failure) {
      emit(UserSubscribedSessionsErrorState(failure.errMessage));
    }, (data) {
      print("mostafa");
      emit(UserSubscribedSessionsSuccessState(data));
    });
  }
}
