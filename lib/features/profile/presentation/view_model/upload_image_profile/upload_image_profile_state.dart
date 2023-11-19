part of 'upload_image_profile_cubit.dart';

@immutable
abstract class UploadImageProfileState {}

class UploadImageProfileInitial extends UploadImageProfileState {}

class UploadImageLoadingState extends UploadImageProfileState {}
class UploadImageSuccessState extends UploadImageProfileState {
  final File?image;
  UploadImageSuccessState({required this.image});
}
