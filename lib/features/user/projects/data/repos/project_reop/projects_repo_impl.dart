import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/core/errors/failure.dart';
import 'package:resithon_event/features/user/projects/data/models/evaluation_project_model.dart';
import 'package:resithon_event/features/user/projects/data/models/evaluation_responce_model.dart';
import 'package:resithon_event/features/user/projects/data/models/project_model.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../../../core/utils/services/remote_services/endpoints.dart';
import 'projects_repo.dart';


class ProjectsRepoImpl implements ProjectsRepo{
  final ApiService? apiService;

  ProjectsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ProjectModel>> getAllProjects() async{
    try {
      var response = await apiService!.get(sendCode: true,endPoint: EndPoints.allProjects);
      var result=ProjectModel.fromJson(response.data);
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

  @override
  Future<Either<Failure, EvaluationProjectModel>> getProjectEvaluations() async{
    try {
      var response = await apiService!.get(sendCode: true,endPoint: EndPoints.getProjectEvaluations);
      var result=EvaluationProjectModel.fromJson(response.data);
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

  @override
  Future<Either<Failure, EvaluationResponseModel>> postProjectEvaluations({required var data}) async{
    try {
      var response = await apiService!.postData(sendCode: true,endPoint: EndPoints.postProjectEvaluations,data: data);
      var result=EvaluationResponseModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      print("error Zeka :$e");
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