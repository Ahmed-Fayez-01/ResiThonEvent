import 'package:resithon_event/features/notifications/data/models/delete_notify_model.dart';
import 'package:resithon_event/features/notifications/data/models/notifications_model.dart';

abstract class NotificationsStates{}


class NotificationsInitState extends NotificationsStates{}

class GetAllNotificationsDataLoadingState extends NotificationsStates{}
class GetAllNotificationsDataErrorState extends NotificationsStates{
  final String msg;
  GetAllNotificationsDataErrorState(this.msg);
}
class GetAllNotificationsDataSuccessState extends NotificationsStates{
  NotificationsModel model;
  GetAllNotificationsDataSuccessState(this.model);
}

class DeleteOneNotificationsLoadingState extends NotificationsStates{}
class DeleteOneNotificationsErrorState extends NotificationsStates{
  final String msg;
  DeleteOneNotificationsErrorState(this.msg);
}
class DeleteOneNotificationsSuccessState extends NotificationsStates{
  DeleteNotificationModel deleteNotificationModel;
  DeleteOneNotificationsSuccessState(this.deleteNotificationModel);
}

class DeleteAllNotificationsLoadingState extends NotificationsStates{}
class DeleteAllNotificationsErrorState extends NotificationsStates{
  final String msg;
  DeleteAllNotificationsErrorState(this.msg);
}
class DeleteAllNotificationsSuccessState extends NotificationsStates{
  DeleteNotificationModel deleteNotificationModel;
  DeleteAllNotificationsSuccessState(this.deleteNotificationModel);
}