import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/core/errors/failure.dart';
import 'package:resithon_event/features/orginizer/scan_qr/data/models/scan_model.dart';

import '../../../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../../../core/utils/services/remote_services/endpoints.dart';
import 'scan_repo.dart';

class ScanRepoImpl implements ScanRepo{
  final ApiService? apiService;

  ScanRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ScanModel>> scanUser({required var data}) async{
    try {
      var response = await apiService!.postData(endPoint: EndPoints.scanUsers,data: data,sendCode: true);
      var result=ScanModel.fromJson(response.data);
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