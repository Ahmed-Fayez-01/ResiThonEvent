import 'package:resithon_event/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserModel>> loginUser({required String code});
}