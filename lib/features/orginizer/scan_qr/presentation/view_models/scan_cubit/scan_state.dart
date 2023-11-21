part of 'scan_cubit.dart';

@immutable
abstract class ScanState {}

class ScanInitial extends ScanState {}
class UserScanLoadingState extends ScanState {}
class UserScanSuccessState extends ScanState {
  ScanModel model;
  UserScanSuccessState(this.model);
}
class UserScanErrorState extends ScanState {
  final String errMessage;
  UserScanErrorState(this.errMessage);
}
