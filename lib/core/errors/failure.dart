import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/constants.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeOut".tr());
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeOut".tr());
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receiveTimeOut".tr());
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("requestCanceled".tr());
      case DioExceptionType.unknown:
        if (dioException.error!.toString().contains("SocketException")) {
          return ServerFailure("noInternet".tr());
        }else
          {
            return ServerFailure("unexpectedError".tr());
          }

      default:
        return ServerFailure("opps".tr());
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(response["message"]);
    } else if (statusCode == 500) {
      return ServerFailure("internalServerError".tr());
    } else if (statusCode == 404) {
      return ServerFailure("requestNotFound".tr());
    } else {
      return ServerFailure("opps".tr());
    }
  }
}
