import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String uri;
  const CustomVideoPlayer({super.key, required this.uri});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late final PodPlayerController controller;
  @override
  void initState() {
    print("url: ${widget.uri}");
    final video = widget.uri;
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(video),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: controller,
    );
  }
}
