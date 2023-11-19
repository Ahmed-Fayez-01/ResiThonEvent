import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/constants.dart';
import 'chewi_list_item.dart';
import 'chewie_list_view.dart';

class VideosViewBody extends StatelessWidget {
  const VideosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChewieListView(),
        ],
      ),
    );
  }
}
