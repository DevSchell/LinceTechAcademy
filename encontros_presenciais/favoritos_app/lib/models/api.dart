import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<Video> getVideo(String urlID) async {
  final videoID = YoutubePlayer.convertUrlToId(urlID);
  final String url = "http://192.168.3.50:8888/video/$videoID";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print("Requisição deu bom!");
    final Map<String, dynamic> dados = jsonDecode(response.body);
    print(dados);
    return Video.fromJson(dados);
  } else {
    throw Exception("Erro ${response.statusCode}: ${response.body}");
  }
}

class Video {
  String imagem;
  String titulo;
  Canal canal;

  Video.fromJson(Map<String, dynamic> json)
    : imagem = json['imagem'],
      titulo = json['titulo'],
      canal = Canal.fromJson(json['canal']);
}

class Canal {
  String nome;
  String url;

  Canal.fromJson(Map<String, dynamic> json)
  : nome = json['nome'],
    url = json['url'];
}
