
import 'package:designsprit/core/network/api_const.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);
  String videoUrl;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late final VideoPlayerController _videoPlayerController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      ApiConst.getChatMedia(widget.videoUrl),
    )..initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(_videoPlayerController),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                if (isPlaying) {
                  _videoPlayerController.pause();
                } else {
                  _videoPlayerController.play();
                }

                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              icon: isPlaying
                  ? const Opacity(
                      opacity: 0.6,
                      child: Icon(
                        Icons.pause_circle,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    )
                  : const Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 36.0,
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: VideoProgressIndicator(
              _videoPlayerController,
              allowScrubbing: true,
            ),
          ),
        ],
      ),
    );
  }
}
