import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mod_android/theme.dart';
import 'package:video_player/video_player.dart';

class PlayMoviePage extends StatefulWidget {
  final String urlVideo;
  const PlayMoviePage({Key? key, required this.urlVideo}) : super(key: key);

  @override
  State<PlayMoviePage> createState() => _PlayMoviePageState();
}

class _PlayMoviePageState extends State<PlayMoviePage> {
  late VideoPlayerController controllerVideo;
  late ChewieController _chewieController;

  @override
  void initState() {
    controllerVideo =
        VideoPlayerController.networkUrl(Uri.parse(widget.urlVideo));
    _chewieController = ChewieController(
      allowFullScreen: true,
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
        backgroundColor: backgroundSecondary,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 25,
          ),
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
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_primary.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icon_back.png",
              height: 25,
            ),
          ),
        ),
        // extendBodyBehindAppBar: false,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
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
