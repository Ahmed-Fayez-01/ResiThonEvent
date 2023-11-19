import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  const ChewieListItem(
      {super.key, required this.videoPlayerController, required this.looping});

  final VideoPlayerController videoPlayerController;
  final bool looping;

  @override
  State<ChewieListItem> createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        looping: widget.looping,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(AppConstants.sp20(context)),
      child: Chewie(controller: _chewieController),
    );
  }
}
