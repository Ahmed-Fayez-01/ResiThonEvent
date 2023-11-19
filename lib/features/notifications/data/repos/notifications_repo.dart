 import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/notifications_model.dart';

abstract class NotificationsRepo{
  Future<Either<Failure,NotificationsModel>> getNotificationsData();
}