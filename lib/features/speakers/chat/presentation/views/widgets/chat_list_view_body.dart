import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/shared_widgets/error_widget.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/speakers/chat/presentation/view_model/speaker_chat_cubit.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/private_chats_list_body.dart';

import '../../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../data/repo/speaker_chat_repo_impl.dart';
import 'chats_public_group_body.dart';

class ChatListViewBody extends StatelessWidget {
  const ChatListViewBody(
      {Key? key, required this.sessionId, required this.name, required this.groupImage})
      : super(key: key);
  final int sessionId;
  final String name;
  final String groupImage;

  @override
  Widget build(BuildContext context) {
    print(sessionId);
    print("mostafa");
    return BlocProvider(
      create: (context) => SpeakerChatCubit(
        getIt.get<SpeakersChatRepoImpl>(),
      )..getAllUsersInChatList(sessionId: sessionId),
      child: BlocConsumer<SpeakerChatCubit, SpeakerChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(AppConstants.sp20(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name public".tr(),
                  style: TextStyle(
                    fontSize: AppConstants.sp14(context),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                // هيتعمل ليها refactor تانى
                if (state is GetAllUsersInChatLoadingState)
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primarySwatchColor,
                    ),
                  ),
                if (state is GetAllUsersInChatSuccessState)
                ChatsPublicGroupBody(
                    sessionId: sessionId,
                    name: name,
                  groupImage: groupImage,
                  allUsersListInChatModel: state.allUsersListInChatModel,
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                Text(
                  "private".tr(),
                  style: TextStyle(
                    fontSize: AppConstants.sp14(context),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                if (state is GetAllUsersInChatErrorState)
                  CustomErrorWidget(onTap: () {
                    context
                        .read<SpeakerChatCubit>()
                        .getAllUsersInChatList(sessionId: sessionId);
                  }),
                if (state is GetAllUsersInChatLoadingState)
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primarySwatchColor,
                    ),
                  ),
                if (state is GetAllUsersInChatSuccessState)
                  PrivateChatsListBody(
                    allUsersListInChatModel: state.allUsersListInChatModel,
                    sessionId: sessionId,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
