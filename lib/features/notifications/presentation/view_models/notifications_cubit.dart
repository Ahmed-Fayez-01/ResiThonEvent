 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/features/notifications/data/repos/notifications_repo.dart';

import 'notifications_states.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitState());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  NotificationsRepo? notificationsRepo;


  Future<void> getNotificationsData() async {
    emit(GetAllNotificationsDataLoadingState());
    var result = await notificationsRepo!.getNotificationsData();
    return result.fold((failure) {
      emit(GetAllNotificationsDataErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      emit(GetAllNotificationsDataSuccessState(data));
    });
  }
}