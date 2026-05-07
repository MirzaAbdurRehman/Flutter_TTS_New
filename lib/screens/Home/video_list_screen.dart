import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  late List<YoutubePlayerController> _videoControllers;

  final List<String> videoIds = [
    'LMVH8edITPY',
    'g2iTQiDHOpA',
    'V2vlkeMRfCI',
  ];

  @override
  void initState() {
    super.initState();
    _videoControllers = videoIds.map((id) {
      return YoutubePlayerController.fromVideoId(
        videoId: id,
        autoPlay: false,
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.close();
    }
    super.dispose();
  }

  Widget buildVideoPlayer(YoutubePlayerController controller) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video List',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: ListView.builder(
        itemCount: _videoControllers.length,
        itemBuilder: (context, index) {
          return buildVideoPlayer(_videoControllers[index]);
        },
      ),
    );
  }
}
