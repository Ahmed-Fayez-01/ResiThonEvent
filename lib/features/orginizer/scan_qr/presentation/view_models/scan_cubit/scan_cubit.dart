import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/features/orginizer/scan_qr/data/models/scan_model.dart';

import '../../../data/repos/scan_repo/scan_repo.dart';



part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit(this.scanRepo) : super(ScanInitial());
  ScanRepo? scanRepo;
  Future<void> scanUser({required var data}) async {
    emit(UserScanLoadingState());
    var result = await scanRepo!.scanUser(data: data);
    return result.fold((failure) {
      emit(UserScanErrorState(failure.errMessage));
    }, (data) {
      emit(UserScanSuccessState(data));
    });
  }
}
