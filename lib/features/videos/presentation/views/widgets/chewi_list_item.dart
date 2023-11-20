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
          print("errorMessage");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.video_settings_rounded,color: Colors.grey,size: MediaQuery.of(context).size.height*.08),
                const Text(
                  "Error in Loading Video.....try Later",
                  style:  TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
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
      padding: EdgeInsets.symmetric(horizontal:AppConstants.sp20(context)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
        child: Container(
          color: Colors.grey,
          child: Chewie(controller: _chewieController),
        ),
      ),
    );
  }
}
