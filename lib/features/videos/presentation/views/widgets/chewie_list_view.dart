import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/shared_widgets/error_widget.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../user/home/presentation/view_models/event_cubit/event_cubit.dart';
import 'chewi_list_item.dart';

class ChewieListView extends StatelessWidget {
  const ChewieListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EventCubit>().eventDetails();
    return   BlocBuilder<EventCubit, EventState>(
      builder: (BuildContext context, EventState state) {
        if (state is UserEventSuccessState) {
          return  ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                      child: Text(state.model.data!.videos![index].date!,style: TextStyle(
                          color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height*.018,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    SizedBox(height: AppConstants.height5(context),),
                    SizedBox(
                        height: MediaQuery.of(context).size.height*.23,
                        child: ChewieListItem(
                            videoPlayerController: VideoPlayerController.networkUrl(
                                Uri.parse(state.model.data!.videos![index].path!)),
                            looping: true)),
                  ],
                );
              },
              itemCount: state.model.data!.videos!.length, separatorBuilder: (BuildContext context, int index) {
                return  SizedBox(height: AppConstants.height20(context),);
          },);
        } else if (state is UserEventErrorState) {
          return CustomErrorWidget(onTap: () {
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
