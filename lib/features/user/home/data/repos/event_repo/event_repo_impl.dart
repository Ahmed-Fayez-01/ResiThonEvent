import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/core/errors/failure.dart';

import '../../../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../../../core/utils/services/remote_services/endpoints.dart';
import '../../models/event_model.dart';
import 'event_repo.dart';


class EventRepoImpl implements EventRepo{
  final ApiService? apiService;

  EventRepoImpl(this.apiService);

  @override
  Future<Either<Failure, EventModel>> eventDetails() async{
    try {
      var response = await apiService!.get(sendCode: true,endPoint: EndPoints.eventPoint,);
      var result=EventModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}