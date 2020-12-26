import 'package:flutter/material.dart';
import 'package:lovem_a_music_app/custom%20widgets/UserDrawer.dart';
import 'package:lovem_a_music_app/helpers/singersService.dart';
import 'package:lovem_a_music_app/models/Singer.dart';
import 'package:lovem_a_music_app/models/User.dart';
import 'package:lovem_a_music_app/screens/songDetails.dart';

class ArtistDetails extends StatefulWidget {
  User user;
  ArtistDetails(this.user);

  @override
  _ArtistDetailsState createState() => _ArtistDetailsState();
}

class _ArtistDetailsState extends State<ArtistDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SingerService singerService = new SingerService();
    singerService.getSingers(getSingers);
  }
  List<Singer> singers =[];

  getSingers(List<Singer> singers){
    this.singers=singers;
    setState(() {});
    print(singers);
    return singers;
  }

  Widget _printSingers(Singer singer){
    return GestureDetector(
      onTap: (){
        String singerName = singer.name;
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SongDetails(singerName)));
      },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(singer.image),fit: BoxFit.cover),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.red,blurRadius: 15)],
          border: Border.all(color: Colors.red,width: 2),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawer(widget.user),
      appBar: AppBar(
        title: Text('Artist Details',style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.yellow,
                  Colors.lightBlue,
                  Colors.pink,
                  Colors.tealAccent,
                  Colors.purple,
                ],begin: Alignment.topLeft,end: Alignment.bottomRight
              )
            ),
          ),
          GridView.builder(
            itemCount: singers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context,int index) {
              Singer currentSinger = singers[index];
              return _printSingers(currentSinger);
          })
        ]

        ),
      );
  }
}
