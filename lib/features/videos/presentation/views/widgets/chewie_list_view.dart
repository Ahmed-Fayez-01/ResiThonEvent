import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/constants.dart';
import 'chewi_list_item.dart';

class ChewieListView extends StatelessWidget {
  const ChewieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
         return SizedBox(
              height: 240,
              child: ChewieListItem(
                  videoPlayerController: VideoPlayerController.networkUrl(
                      Uri.parse(
                          "http://resithon.site/upload/videos/6559db58606b5.mp4")),
                  looping: true));
        },
        separatorBuilder: (context, int index) {
          return SizedBox(height: AppConstants.height20(context),);
        },
        itemCount: 3);
  }
}
