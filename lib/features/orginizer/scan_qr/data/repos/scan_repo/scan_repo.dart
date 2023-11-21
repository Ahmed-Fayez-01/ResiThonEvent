import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../models/scan_model.dart';

abstract class ScanRepo{
  Future<Either<Failure,ScanModel>> scanUser({required var data});
}