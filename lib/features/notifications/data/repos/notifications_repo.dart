 import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/delete_notify_model.dart';
import '../models/notifications_model.dart';

abstract class NotificationsRepo{
  Future<Either<Failure,NotificationsModel>> getNotificationsData();
  Future<Either<Failure,DeleteNotificationModel>> deleteOneNotification({required int notifyId});
  Future<Either<Failure,DeleteNotificationModel>> deleteAllNotifications();
}