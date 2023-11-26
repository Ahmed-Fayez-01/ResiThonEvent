import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_cubit.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_states.dart';
import 'package:resithon_event/features/notifications/presentation/views/widgets/speaker_notifications_views_body.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/custom_dialog.dart';
import '../../../../core/utils/assets/assets.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/services/remote_services/service_locator.dart';
import '../../data/repos/notifications_repo_impl.dart';

class NotificationsViews extends StatefulWidget {
  const NotificationsViews({Key? key}) : super(key: key);

  @override
  State<NotificationsViews> createState() => _NotificationsViewsState();
}

class _NotificationsViewsState extends State<NotificationsViews> {
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => NotificationsCubit(getIt.get<NotificationsRepoImple>())..getNotificationsData(),
      child: BlocConsumer<NotificationsCubit , NotificationsStates>(
        listener: (context,state){
          if(state is DeleteAllNotificationsSuccessState){
            Navigator.pop(context);
            NotificationsCubit.get(context).getNotificationsData();
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                  size: MediaQuery.of(context).size.height*.016,
                  color: Colors.black,),
                onPressed: (){
                  setState(() {
                    NotificationsCubit.l = 0;
                  });
               //   CacheHelper.removeData(key: "NotificationsListLengthInCash");
               //   Navigator.pop(context);
        },
              ),
              actions: [
                if(state is GetAllNotificationsDataSuccessState && state.model.data!.isNotEmpty)
                  IconButton(
                    onPressed: (){
                      customPopUpDialog(
                        context: context,
                        button: DefaultButton(
                          onPress: () {
                            context.read<NotificationsCubit>().deleteAllNotifications();
                          },
                          text: "Delete",
                          borderRadius: AppConstants.sp10(context),
                          backgroundColor:
                          const Color(0xff323232),
                        ),
                        icon: AssetData.cancel,
                        mainTitle: "cancelMessage".tr(),
                      );
                    },
                    icon: Icon(Icons.delete_forever,
                      color: AppColors.primaryColor,),
                  )
              ],
              elevation: 0,
              systemOverlayStyle:  const SystemUiOverlayStyle(
                statusBarColor: Colors.white, // <-- SEE HERE
                statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
                systemNavigationBarColor:Colors.white,
                statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
              ),
              title: Text("notification".tr(),
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: MediaQuery.of(context).size.height*.018,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff323232)
                ),),
            ),
            resizeToAvoidBottomInset: false,
            extendBody: true,
            body: const NotificationsViewsBody(),
          );
        },

      ),
    );
  }
}
