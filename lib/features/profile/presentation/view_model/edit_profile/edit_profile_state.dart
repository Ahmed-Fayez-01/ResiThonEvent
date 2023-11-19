part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}
class UserEditProfileLoadingState extends EditProfileState {}
class UserEditProfileSuccessState extends EditProfileState {}
class UserEditProfileErrorState extends EditProfileState {
  final String errMessage;
  UserEditProfileErrorState(this.errMessage);
}
