import 'package:http/http.dart';
import 'package:lovem_a_music_app/models/Singer.dart';
import 'package:lovem_a_music_app/models/User.dart';
import 'package:lovem_a_music_app/utils/constants.dart';
import 'package:lovem_a_music_app/utils/server.dart';
import 'dart:convert' as convert;
class SingerService{
  getSingers(Function callBack){
    List<Singer> singers = [];
    Future<Response> future = Server.callServer(Constants.singersUrl);
    future.then((Response response) {
      String json = response.body;
      Map<String,dynamic> map = convert.jsonDecode(json);
      List<dynamic> listOfMap = map['singers'];
      singers = listOfMap.map((dynamic map) {
        Singer singer = new Singer(map['name'],map['photo']);
        return singer;
      }).toList();
      print("singers are $singers");
      callBack(singers);
    }).catchError((err){print("Singer Service Error : $err");});
  }
}