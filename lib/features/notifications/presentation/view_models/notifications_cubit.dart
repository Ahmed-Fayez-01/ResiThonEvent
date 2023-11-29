 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
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
      CacheHelper.saveData(key: "newNotificationLength", value: data.data!.length);
      print("noti : ${CacheHelper.getData(key: "newNotificationLength")}");
      emit(GetAllNotificationsDataSuccessState(data));
    });
  }

    deleteOneNotifications({required int notifyId}) async {
    emit(DeleteOneNotificationsLoadingState());
    var result = await notificationsRepo!.deleteOneNotification(notifyId: notifyId);
    return result.fold((failure) {
      emit(DeleteOneNotificationsErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      emit(DeleteOneNotificationsSuccessState(data));
    });
  }

  deleteAllNotifications() async {
    emit(DeleteAllNotificationsLoadingState());
    var result = await notificationsRepo!.deleteAllNotifications();
    return result.fold((failure) {
      emit(DeleteAllNotificationsErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      emit(DeleteAllNotificationsSuccessState(data));
    });
  }

}