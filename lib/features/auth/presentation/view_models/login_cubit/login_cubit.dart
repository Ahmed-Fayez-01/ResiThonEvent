import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../data/repos/auth_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo? authRepo;
  Future<void> loginUser({required String code}) async {
    emit(UserLoginLoadingState());
    var result = await authRepo!.loginUser(code: code);
    return result.fold((failure) {
      emit(UserLoginErrorState(failure.errMessage));
    }, (data) {
      CacheHelper.saveData(key: "name", value: data.data!.name);
      CacheHelper.saveData(key: "image", value: data.data!.image);
      CacheHelper.saveData(key: "role", value: data.data!.role);
      CacheHelper.saveData(key: "QR", value: data.data!.qr);
      CacheHelper.saveData(key: "bio", value: data.data!.iCan);
      CacheHelper.saveData(key: "code", value: data.data!.code);
      CacheHelper.saveData(key: "id", value: data.data!.id);
      CacheHelper.saveData(key: "can_rate", value: data.data!.canRate);
      CacheHelper.saveData(key: "event_start_day", value: data.data!.event_start_date);
      CacheHelper.saveData(key: "event_end_day", value: data.data!.event_end_date);
      emit(UserLoginSuccessState());
    });
  }
}
