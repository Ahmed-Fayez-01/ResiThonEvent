import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/user/home/data/models/event_model.dart';

import '../../../data/repos/event_repo/event_repo.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.eventRepo) : super(EventInitial());
  EventRepo? eventRepo;
  Future<void> eventDetails() async {
    emit(UserEventLoadingState());
    var result = await eventRepo!.eventDetails();
    return result.fold((failure) {
      emit(UserEventErrorState(failure.errMessage));
    }, (data) {
      CacheHelper.saveData(key: "chat_expired", value: data.data!.chat_expire_at);
      CacheHelper.saveData(key: "session_expired", value: data.data!.session_expire_at);
      CacheHelper.saveData(key: "event_start_day", value: data.data!.startDate);
      CacheHelper.saveData(key: "event_end_day", value: data.data!.endDate);
      emit(UserEventSuccessState(data));
    });
  }
}
