import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lovem_a_music_app/models/Song.dart';
import 'package:lovem_a_music_app/screens/songPlayer.dart';
import 'package:lovem_a_music_app/utils/constants.dart';
import 'package:lovem_a_music_app/utils/server.dart';
import 'dart:convert' as convert;
class SongDetails extends StatefulWidget {
  String singerName;
  SongDetails(this.singerName);
  @override
  _SongDetailsState createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {

  Future<List<Song>>_callSongs() async{
    String URL = Constants.songsUrl+"term="+widget.singerName+"&limit=20";
    Response response = await Server.callServer(URL);
    String json =response.body;
    Map<String, dynamic> map = convert.jsonDecode(json);
    List<dynamic> listOfSong = map['results'];
    List<Song> songs = listOfSong.map((dynamic song) {
      Song songObj = Song();
      songObj.albumPhoto=song['artworkUrl100'];
      songObj.artist=song['artistName'];
      songObj.title=song['trackName'];
      songObj.audioUrl=song['previewUrl'];
      return songObj;
    }).toList();
    return songs;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: FutureBuilder(
        future: _callSongs(),
        builder: (BuildContext ctx,AsyncSnapshot snapShot){
          if (!snapShot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapShot.hasError){
            return Center(child: Text("Some Error in Server Call for songs"),);
          }
          return ListView.builder(itemBuilder: (BuildContext ct,int index){
          return Card(
            elevation: 5,
            shadowColor: Colors.greenAccent,
            child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SongPlayer(snapShot.data[index])));
              },
              leading: Image.network(snapShot.data[index].albumPhoto),
              title: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(snapShot.data[index].title)),
              subtitle: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(snapShot.data[index].artist)),
              trailing: IconButton(icon: Icon(Icons.play_circle_fill,color: Colors.greenAccent,size: 32,),),
            ),
          );
            },itemCount: snapShot.data.length,);
        }
      ),
    );
  }
}