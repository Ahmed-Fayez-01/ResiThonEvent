import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:resithon_event/core/errors/failure.dart';
import 'package:resithon_event/features/notifications/data/models/delete_notify_model.dart';

import 'package:resithon_event/features/notifications/data/models/notifications_model.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'notifications_repo.dart';

class NotificationsRepoImple extends NotificationsRepo
{
  final ApiService? apiService;

  NotificationsRepoImple(this.apiService);

  @override
  Future<Either<Failure, NotificationsModel>> getNotificationsData()async {
    try {
      var response = await apiService!.get(
        endPoint: EndPoints.notifications,
      sendCode: true,
      );
      var result=NotificationsModel.fromJson(response.data);

      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }

  @override
  Future<Either<Failure, DeleteNotificationModel>> deleteAllNotifications() async{
    try {
      var response = await apiService!.deleteData(
        endPoint: EndPoints.deleteAllNotification,
        sendCode: true,
      );
      var result=DeleteNotificationModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }

  @override
  Future<Either<Failure, DeleteNotificationModel>> deleteOneNotification({required int notifyId}) async{
    try {
      var response = await apiService!.deleteData(
        endPoint: "${EndPoints.deleteOneNotification}/$notifyId",
        sendCode: true,
      );
      var result=DeleteNotificationModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }

}