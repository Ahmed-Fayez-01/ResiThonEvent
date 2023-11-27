import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/send_msg_button.dart';

import '../../../../../../core/shared_widgets/no_internet_widget.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../data/repo/speaker_chat_repo_impl.dart';
import '../../view_model/speaker_chat_cubit.dart';

class ChatMessagesDetailsBody extends StatefulWidget {

  const ChatMessagesDetailsBody({Key? key, required this.chatType, required this.sessionId, required this.reciverId,    }) : super(key: key);
  final int chatType;
  final int sessionId;
   final int reciverId;
  @override
  State<ChatMessagesDetailsBody> createState() => _ChatMessagesDetailsBodyState();
}


class _ChatMessagesDetailsBodyState extends State<ChatMessagesDetailsBody> {
  final scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=> SpeakerChatCubit(getIt.get<SpeakersChatRepoImpl>(),)
        ..connectToServer(  type: widget.chatType ,
            sessionId:  widget.sessionId)
        ..getNewMessages(
            type: widget.chatType ,
            sessionId:  widget.sessionId)
        ..getAllMessages(
        type: widget.chatType ,
        sessionId:  widget.sessionId, reciverId: widget.reciverId.toString()) ,
      child: BlocConsumer<SpeakerChatCubit , SpeakerChatState>(
        listener: (context,state){
          if(state is GetAllMessagesSuccessState){
            Future.delayed(const Duration(milliseconds: 100)).then((value) {
              FocusManager.instance.primaryFocus?.unfocus();
               scrollController.jumpTo(
                 scrollController.position.maxScrollExtent,
                // duration:const Duration(seconds: 1),
                // curve: Curves.fastOutSlowIn,
              );
            });
          }
        },
        builder: (context , state ){
          return Container(
            color: const Color(0x66DCDCDC),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.sp10(context),
                      vertical: AppConstants.sp10(context),
                    ),
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: SpeakerChatCubit.get(context).allChatMessages.length,
                      itemBuilder: (context, index) {
                        // Chat message bubble code remains the same
                        return Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height * .005,),
                          child: Directionality(
                            textDirection: SpeakerChatCubit.get(context).allChatMessages[index].senderId != CacheHelper.getData(key: "id").toString()?TextDirection.rtl:TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Sender image container
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CachedNetworkImage(
                                      imageUrl: "${SpeakerChatCubit.get(context).allChatMessages[index].senderImage}",
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(width: AppConstants.width5(context),),
                                // Message container
                                Flexible(
                                  child: Padding(
                                    padding:
                                    (SpeakerChatCubit.get(context).allChatMessages[index].senderId) != CacheHelper.getData(key: "id").toString() ?
                                    EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width*.1
                                    ) : EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width*.1
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(AppConstants.height15(context)),
                                      decoration: BoxDecoration(
                                        color: (SpeakerChatCubit.get(context).allChatMessages[index].senderId) != CacheHelper.getData(key: "id").toString() ?
                                        AppColors.primaryColor : const Color(0xffDCDCDC),
                                        borderRadius:
                                        (SpeakerChatCubit.get(context).allChatMessages[index].senderId) == CacheHelper.getData(key: "id").toString() ?
                                        BorderRadius.only(
                                          topRight: Radius.circular(AppConstants.height10(context)),
                                          bottomRight: Radius.circular(AppConstants.height10(context)),
                                          bottomLeft: Radius.circular(AppConstants.height10(context)),
                                        ) : BorderRadius.only(
                                          topLeft: Radius.circular(AppConstants.height10(context)),
                                          bottomRight: Radius.circular(AppConstants.height10(context)),
                                          bottomLeft: Radius.circular(AppConstants.height10(context)),
                                        ),
                                      ),
                                      child: Text(
                                        "${SpeakerChatCubit.get(context).allChatMessages[index].message}",
                                        style: TextStyle(
                                            color: (SpeakerChatCubit.get(context).allChatMessages[index].senderId) != CacheHelper.getData(key: "id").toString() ?
                                            Colors.white : Colors.black,
                                            fontSize: AppConstants.sp14(context),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins"
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding:   EdgeInsets.only(
                      bottom:  MediaQuery.of(context).viewInsets.bottom
                    ,),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.sp20(context)),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .06,
                            child: TextField(
                              controller: SpeakerChatCubit.get(context).messageController,
                              decoration: InputDecoration(
                                hintText: 'Your Message',
                                hintStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height * .016,
                                    color: const Color(0xffDCDCDC)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants
                                        .sp10(context)),
                                    borderSide: const BorderSide(color: Colors.white)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants
                                        .sp10(context)),
                                    borderSide: const BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants
                                        .sp10(context)),
                                    borderSide: const BorderSide(color: Colors.white)
                                ),
                                filled: true,
                                fillColor: Colors.white,

                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppConstants.width10(context),),
                        InkWell(
                            onTap: (){
                              SpeakerChatCubit.get(context).sendMessage2(
                                sessionId: widget.sessionId,
                                senderId: CacheHelper.getData(key: "id"),
                                type: widget.chatType,
                                message: SpeakerChatCubit.get(context).messageController.text,
                               receiverId: widget.reciverId,
                              );
                              FocusManager.instance.primaryFocus?.unfocus();
                              scrollController.jumpTo(
                                scrollController.position.maxScrollExtent,
                                // duration:const Duration(seconds: 1),
                                // curve: Curves.fastOutSlowIn,
                              );
                            },
                            child: const SendMsgButton()),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppConstants.height20(context),),
              ],
            ),
          );
        },

      ),
    );
  }
}
