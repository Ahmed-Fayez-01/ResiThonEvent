import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
 import 'package:resithon_event/features/profile/data/repos/edit_profile_repo.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitial());
  EditProfileRepo? editProfileRepo;
  Future<void> editUserProfile({MultipartFile? image,String? name, String? bio}) async {
    emit(UserEditProfileLoadingState());
    var result = await editProfileRepo!.editProfile(
        name: name,
        image: image,
        bio: bio,
    );
    return result.fold((failure) {

      emit(UserEditProfileErrorState(failure));
    }, (data) {
      CacheHelper.saveData(key: "name", value: data.data!.name);
      CacheHelper.saveData(key: "image", value: data.data!.image);
      CacheHelper.saveData(key: "bio", value: data.data!.iCan);
      emit(UserEditProfileSuccessState());
    });
  }
}
