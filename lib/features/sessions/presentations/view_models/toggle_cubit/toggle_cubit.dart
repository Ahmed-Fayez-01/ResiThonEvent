import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/constants.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(ToggleInitial());

  static ToggleCubit get(context) => BlocProvider.of(context);


  toggleButton()
  {
    if(AppConstants.currentUserSessionIndex==0)
    {
      AppConstants.currentUserSessionIndex=1;

    }else{
      AppConstants.currentUserSessionIndex=0;
    }
    emit(ToggleButtonState());
  }

  // int initValueIndex = 1;
  // toggleButton(newIndex)
  // {
  //   initValueIndex = newIndex;
  //   emit(ToggleButtonState());
  // }

}
