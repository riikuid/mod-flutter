import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mod_android/theme.dart';
import 'package:video_player/video_player.dart';

class PlayMoviePage extends StatefulWidget {
  const PlayMoviePage({Key? key}) : super(key: key);

  @override
  State<PlayMoviePage> createState() => _PlayMoviePageState();
}

class _PlayMoviePageState extends State<PlayMoviePage> {
  late VideoPlayerController controllerVideo;
  late ChewieController _chewieController;

  @override
  void initState() {
    controllerVideo = VideoPlayerController.asset('assets/example_video.mp4');
    _chewieController = ChewieController(
      allowFullScreen: false,
      controlsSafeAreaMinimum:
          EdgeInsets.symmetric(vertical: 20, horizontal: 70),
      showControls: true,
      videoPlayerController: controllerVideo,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: false,
      autoPlay: true,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: statusCardColor,
        appBar: AppBar(
          centerTitle: true,
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          shadowColor: Colors.transparent,
          actions: const [
            Icon(
              Icons.volume_up_rounded,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.brightness_6_outlined,
            ),
            SizedBox(
              width: 20,
            ),
          ],
          title: Image.asset(
            'assets/kai_logo.png',
            height: 20,
          ),
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icon_back.png",
              height: 25,
            ),
          ),
          elevation: 0,
        ),
        // extendBodyBehindAppBar: false,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Theme(
              data: ThemeData.light().copyWith(
                platform: TargetPlatform.iOS,
              ),
              child: Chewie(
                controller: _chewieController,
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    controllerVideo.dispose();
    _chewieController.dispose();
  }
}
