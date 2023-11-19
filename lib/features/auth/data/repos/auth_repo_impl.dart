import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/core/errors/failure.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_keys.dart';
import 'package:resithon_event/features/auth/data/models/user_model.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final ApiService? apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> loginUser({required String code}) async{
    try {
      var response = await apiService!.postData(endPoint: EndPoints.userLogin,data: {
        "code": code,
        "device_token": "${CacheHelper.getData(key: "FCM_Token")}",
      });
      var result=UserModel.fromJson(response.data);
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