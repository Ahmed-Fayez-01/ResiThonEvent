import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_states.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../core/shared_widgets/empty_widget.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../view_models/notifications_cubit.dart';
import 'notification_item.dart';

class NotificationsViewsBody extends StatelessWidget {
  const NotificationsViewsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NotificationsCubit , NotificationsStates>(
      listener: (context , state){
        if(state is DeleteOneNotificationsSuccessState){
          CacheHelper.saveData(key: "oldNotificationLength", value: int.parse(CacheHelper.getData(key: "oldNotificationLength").toString())-1);
          NotificationsCubit.get(context).getNotificationsData();
        }
      },
      builder: (context , state){
        if(state is GetAllNotificationsDataSuccessState){
          CacheHelper.saveData(key: "NotificationsListLengthInCash", value: state.model.data!.length);
          return Padding(
            padding: EdgeInsets.all(AppConstants.sp20(context)),
            child:
            state.model.data!.isNotEmpty ?
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return   Slidable(
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          NotificationsCubit.get(context).deleteOneNotifications(
                            notifyId:  state.model.data![index].id!,
                          );
                        },
                        backgroundColor: AppColors.primarySwatchColor,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'delete',
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            7,
                          ),
                          bottomLeft: Radius.circular(
                            7,
                          ),
                        ),
                      )
                    ],
                  ),
                  child: NotificationItem(
                    notificationsModel: state.model.data![index],
                  ),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(height: AppConstants.height5(context),);
              },
              itemCount: state.model.data!.length,
            ) :
            const EmptyWidget(),
          );
        }
        if(state is GetAllNotificationsDataLoadingState){
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
