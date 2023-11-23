import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/features/sessions/data/models/sessions_model.dart';

import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';
import '../chat_list_view.dart';
import 'chat_name_item.dart';

class InactiveSessionsWidget extends StatelessWidget {
  const InactiveSessionsWidget(
      {Key? key, this.sessionsModel, required this.availble})
      : super(key: key);
  final SessionsModel? sessionsModel;
  final String availble;

  @override
  Widget build(BuildContext context) {
    return sessionsModel!.data!.isNotEmpty  ? Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return !sessionsModel!.data![index].session_started! ||
                  !sessionsModel!.data![index].is_arrived! ||
                  sessionsModel!.data![index].chat_expire!
              ? InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return const ChatListView();
                    // }));
                    //  GoRouter.of(context).push("/chatListView");
                  },
                  child: Container(
                    padding: EdgeInsets.all(AppConstants.sp20(context)),
                    height: MediaQuery.of(context).size.height * .12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.sp10(context)),
                      border: Border.all(color: const Color(0xffDCDCDC)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${sessionsModel!.data![index].name}",
                                style: TextStyle(
                                  fontSize: AppConstants.sp14(context),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              sessionsModel!.data![index].chat_expire!
                                  ? "Expired"
                                  : !sessionsModel!
                                          .data![index].session_started!
                                      ? "In Queue"
                                      : "Not Allowed",
                              style: TextStyle(
                                fontSize: AppConstants.sp14(context),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color:  sessionsModel!.data![index].chat_expire!
                                    ?  Colors.red
                                    : !sessionsModel!
                                    .data![index].session_started!
                                    ? Color(0xffEDC907)
                                    : const Color(0xFFA5A5A5),

                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetData.clock,
                              color: const Color(0xFFA5A5A5),
                            ),
                            SizedBox(
                              width: AppConstants.width5(context),
                            ),
                            Text(
                              "${sessionsModel!.data![index].startTime}",
                              style: TextStyle(
                                fontSize: AppConstants.sp14(context),
                                color: const Color(0xFFA5A5A5),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: AppConstants.height15(context),
          );
        },
        itemCount: sessionsModel!.data!.length,
      ),
    ):Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetData.noSessions,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .5,
            ),
          ],
        ));
  }
}
