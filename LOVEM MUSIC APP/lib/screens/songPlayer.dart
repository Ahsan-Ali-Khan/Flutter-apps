import 'package:flutter/material.dart';
import 'package:lovem_a_music_app/helpers/customAudioPlayer.dart';
import 'package:lovem_a_music_app/models/Song.dart';
import 'package:lovem_a_music_app/utils/constants.dart';
class SongPlayer extends StatefulWidget {
  Song song;
  SongPlayer(this.song);
  @override
  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Song Player"),),
      body: Container(
        child: Column(
          children: [
            Container(
              height: deviceSize.height*0.4,
              width: deviceSize.width,
              color: Colors.greenAccent,
              child: Center(
                child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: NetworkImage(widget.song.albumPhoto),
                ),
              ),
            ),
            SizedBox(height: deviceSize.height*0.02,),
            Padding(
                padding:EdgeInsets.fromLTRB(deviceSize.width*0.05,0,deviceSize.width*0.05,0),
                child: SingleChildScrollView(
                    scrollDirection:Axis.horizontal,
                    child: Text(widget.song.title,style:TextStyle(fontSize: 32,fontWeight: FontWeight.bold),))),
            SizedBox(height: deviceSize.height*0.01,),
            Padding(
                padding:EdgeInsets.fromLTRB(deviceSize.width*0.05,10,deviceSize.width*0.05,0),
                child: SingleChildScrollView(
                    scrollDirection:Axis.horizontal,
                    child: Text("by "+widget.song.artist,style:TextStyle(fontSize: 24,color: Colors.blue),))),
            SizedBox(height: deviceSize.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                  !isPlaying?Icons.play_arrow:Icons.pause,
                  size: 30,
                ),
                onPressed: () async {
                  if(!isPlaying){
                    int result = await CustomAudioPlayer.play(widget.song.audioUrl);
                    if(result==Constants.success){
                      isPlaying = true;
                      setState(() {});
                      print("Success");
                    } else{
                      print("Failure in Playing Song");
                    }
                  }
                  else{
                      int result = await CustomAudioPlayer.pause();
                      if(result==Constants.success){
                        isPlaying = false;
                        setState(() {});
                        print("Song Paused");
                      } else{
                        print("Failure in Pausing Song");
                      }}
                }),
                IconButton(icon: Icon(Icons.stop,size: 30,), onPressed: ()async{
                  int result = await CustomAudioPlayer.stop();
                  if(result==Constants.success){
                    print("Song Stopped");
                  } else{
                    print("Failure in Stopping Song");
                  }
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
