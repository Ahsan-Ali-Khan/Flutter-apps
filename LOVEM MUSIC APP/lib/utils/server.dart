//generic class to call get data from any server
import 'package:http/http.dart' as http;
class Server{
  Server._(){}
  static Future callServer(String url){
    Future<http.Response> future = http.get(url);
    return future;
  }
}