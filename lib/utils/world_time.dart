import "package:http/http.dart";
import 'dart:convert';

class world_time{
  String location="";
  String time="";
  String flag="";
  String url="";

  world_time({required
  this.location,
   required this.flag,
    required this.url});

  Future<void> getTime() async{
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map curtime = jsonDecode(response.body);
      DateTime now = DateTime.parse(curtime["datetime"]);
      time = now.toString();
    }catch(e){
      time = "couldnt fetch time";
      print(e);
    }

  }
}
