import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/features/profile/data/models/edit_profile_model.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo{
  final ApiService? apiService;

  EditProfileRepoImpl(this.apiService);

  @override
  Future<Either<String, EditProfileModel>> editProfile({
    dynamic image,String? name ,String? bio}) async{
    try {
      var response = await apiService!.postData(
          sendCode: true,endPoint: EndPoints.editProfile,
          data: FormData.fromMap({
              "name": name,
              "i_can": bio,
              "image": image,
          }),
      );
      var result=EditProfileModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      // if(e is DioError && e.response!.statusCode ==403){
      //   final data = e.response?.data;
      //   final message = data['message'];
      //   print("mostafa");
      //   print(message.toString());
      // }
      print(e.toString());
      return left(e.toString());
      // if(e is DioException)
      // {
      //   return left(ServerFailure.fromDioError(e));
      // }
      // else{
      //   return left(ServerFailure(e.toString()));
      // }
    }
  }
}