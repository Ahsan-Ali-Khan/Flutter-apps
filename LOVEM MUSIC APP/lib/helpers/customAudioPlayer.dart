import 'package:audioplayers/audioplayers.dart';

class CustomAudioPlayer{
  CustomAudioPlayer._(){}

  static AudioPlayer _audioPlayer = AudioPlayer();

  static Future<int> play(String url){
    return _audioPlayer.play(url);
  }

  static Future<int> pause(){
    return _audioPlayer.pause();
  }

  static Future<int> stop(){
    return _audioPlayer.stop();
  }
}