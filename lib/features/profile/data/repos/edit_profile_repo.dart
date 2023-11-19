
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:resithon_event/features/profile/data/models/edit_profile_model.dart';
import '../../../../core/errors/failure.dart';

abstract class EditProfileRepo{
  Future<Either<String,EditProfileModel>> editProfile({dynamic image,String? name ,String? bio});
}