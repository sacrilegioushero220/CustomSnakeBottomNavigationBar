import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pod_player/pod_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String? uri;
  const CustomVideoPlayer({super.key, required this.uri});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late final PodPlayerController controller;
  @override
  void initState() {
    super.initState();
    print("url: ${widget.uri}");
    if (widget.uri != null) {
      controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(widget.uri!),
      )..initialise();
    }
  }

  @override
  void dispose() {
    if (widget.uri != null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.uri == null) {
      // If URI is null, show an error message
      return const Center(
        child: Text('No video available'),
      );
    } else {
      // If URI is not null, display the video player
      return PodVideoPlayer(
        onVideoError: () {
          return const Center(
            child: Text(
              'No video found',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
        controller: controller,
      );
    }
  }
}
