import 'package:flutter/material.dart';
import 'package:resithon_event/features/videos/presentation/views/widgets/chewi_list_item.dart';
import 'package:video_player/video_player.dart';

class VideosViewBody extends StatelessWidget {
  const VideosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
