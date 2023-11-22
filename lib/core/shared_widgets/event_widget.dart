import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/shared_widgets/description_point.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/text_styles/styles.dart';
import 'package:resithon_event/features/user/home/presentation/view_models/event_cubit/event_cubit.dart';

import '../utils/colors/colors.dart';
import 'error_widget.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (BuildContext context, EventState state) {
        if (state is UserEventSuccessState) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: Container(
              height: MediaQuery.of(context).size.height * .29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.sp10(context)),
                        topRight: Radius.circular(AppConstants.sp10(context))),
                    child: CachedNetworkImage(
                      imageUrl: state.model.data!.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .14,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.greyColor,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.height10(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.height20(context)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.model.data!.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.eventSessionTitle(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.height15(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.height20(context)),
                    child: Row(
                      children: [
                        Expanded(
                          child: DescriptionPoint(
                            iconPath: AssetData.location,
                            description: state.model.data!.place!,
                          ),
                        ),
                        SizedBox(
                          width: AppConstants.width10(context),
                        ),
                        Expanded(
                          child: DescriptionPoint(
                            iconPath: AssetData.calender,
                            description:
                                "${state.model.data!.startDate!} to ${state.model.data!.endDate!}",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is UserEventErrorState) {
          return  CustomErrorWidget(
            onTap: (){
              context.read<EventCubit>().eventDetails();
            },
          );
        } else if (state is UserEventLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .24,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
