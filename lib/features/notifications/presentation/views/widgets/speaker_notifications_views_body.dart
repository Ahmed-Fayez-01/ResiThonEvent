import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/notifications/data/repos/notifications_repo_impl.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_states.dart';
import 'package:resithon_event/features/speakers/chat/presentation/view_model/speaker_chat_cubit.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../view_models/notifications_cubit.dart';
import 'notification_item.dart';

class NotificationsViewsBody extends StatelessWidget {
  const NotificationsViewsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => NotificationsCubit(
          getIt.get<NotificationsRepoImple>()
      )..getNotificationsData(),
      child: BlocConsumer<NotificationsCubit , NotificationsStates>(
        listener: (context , state){},
        builder: (context , state){
          if(state is GetAllNotificationsDataSuccessState){
            return Padding(
              padding: EdgeInsets.all(AppConstants.sp20(context)),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return   NotificationItem(
                    notificationsModel: state.model.data![index],
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: AppConstants.height5(context),);
                },
                itemCount: state.model.data!.length,
              ),
            );
          }
          if(state is GetAllNotificationsDataLoadingState){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          return const Center(
            child: Text("Error"),
          );
        },
      ),
    );
  }
}
