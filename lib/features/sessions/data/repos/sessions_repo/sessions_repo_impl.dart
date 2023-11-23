import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/core/errors/failure.dart';
import 'package:resithon_event/features/sessions/data/models/book_model.dart';
import 'package:resithon_event/features/sessions/data/models/session_evaluation_model.dart';
import 'package:resithon_event/features/sessions/data/models/session_evaluation_responce_model.dart';

import '../../../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../../../core/utils/services/remote_services/endpoints.dart';
import '../../models/sessions_model.dart';
import '../../models/specific_session_model.dart';
import 'sessions_repo.dart';


class SessionsRepoImpl implements SessionsRepo {
  final ApiService? apiService;

  SessionsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SessionsModel>> getAllSessions(
      {Map<String, dynamic>? query}) async {
    try {
      var response = await apiService!.get(
          sendCode: true, endPoint: EndPoints.allSessions, query: query);
      var result = SessionsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SessionsModel>> getSubscribedSessions(
      {Map<String, dynamic>? query}) async {
    try {
      var response = await apiService!.get(
          sendCode: true, endPoint: EndPoints.subscribedSessions, query: query);
      var result = SessionsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      print("dhjsdhjdida ${e}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SpecificSessionModel>> getSpecificSession(
      {required int id}) async {
    try {
      var response = await apiService!.get(
        sendCode: true, endPoint: "${EndPoints.allSessions}/$id",);
      var result = SpecificSessionModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BookModel>> bookSession({required int id}) async {
    try {
      var response = await apiService!.postData(
          sendCode: true, endPoint: EndPoints.bookSession, data: {
        "session_id": id
      });
      var result = BookModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BookModel>> cancelBookSession(
      {required int id}) async {
    try {
      var response = await apiService!.postData(
          sendCode: true, endPoint: EndPoints.cancelSession, data: {
        "session_id": id
      });
      var result = BookModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<
      Either<Failure, SessionEvaluationResponseModel>> postSessionsEvaluations(
      {required data}) async {
    try {
      var response = await apiService!.postData(sendCode: true,
          endPoint: EndPoints.postSessionEvaluations,
          data: data);
      var result = SessionEvaluationResponseModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      print("faaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:$e");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<
      Either<Failure, SessionEvaluationModel>> getSessionsEvaluations() async {
    try {
      var response = await apiService!.get(
          sendCode: true, endPoint: EndPoints.getSessionEvaluations);
      var result = SessionEvaluationModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}