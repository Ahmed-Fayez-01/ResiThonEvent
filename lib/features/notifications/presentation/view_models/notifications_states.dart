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