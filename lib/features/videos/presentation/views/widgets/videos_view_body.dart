import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/constants.dart';
import 'chewi_list_item.dart';
import 'chewie_list_view.dart';

class VideosViewBody extends StatelessWidget {
  const VideosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
        height: 240,
        child: ChewieListItem(
            videoPlayerController: VideoPlayerController.networkUrl(
                Uri.parse(
                    "http://resithon.site/upload/videos/65596dd21a043.mp4")),
            looping: true)),
      ],
    );
  }
}
