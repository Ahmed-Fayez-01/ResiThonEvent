
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/features/sessions/data/models/book_model.dart';

import '../../../data/models/sessions_model.dart';
import '../../../data/repos/sessions_repo/sessions_repo.dart';

part 'book_sessions_state.dart';

class BookSessionsCubit extends Cubit<BookSessionsState> {
  BookSessionsCubit(this.sessionsRepo) : super(BookSessionsInitial());
  SessionsRepo? sessionsRepo;
  Future<void> bookSession({required int id}) async {
    emit(UserBookSessionsLoadingState());
    var result = await sessionsRepo!.bookSession(id: id);
    return result.fold((failure) {
      emit(UserBookSessionsErrorState(failure.errMessage));
    }, (data) {
      emit(UserBookSessionsSuccessState(data));
    });
  }
}
