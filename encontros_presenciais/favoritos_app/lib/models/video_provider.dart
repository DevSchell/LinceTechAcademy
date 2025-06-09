import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';

class VideoProvider with ChangeNotifier {
  List<VideoApp> listaVideos = [];
  late String url;
  bool _isSearching = !false;

  bool get isSearching => _isSearching;

  void pesquisar() {
    _isSearching = !_isSearching;
    notifyListeners();
  }
  void addVideo(String listaTags) async {
    Video v = await getVideo(url);
    List<String> tags = listaTags.split(',');
    VideoApp video = VideoApp(video: v, tags: tags);
    listaVideos.add(video);
    notifyListeners();
  }
}

class VideoApp {
  Video video;
  List<String> tags;

  VideoApp({
    required this.video,
    required this.tags,
});
}
