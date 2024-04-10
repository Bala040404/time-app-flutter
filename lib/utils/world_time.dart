import "package:http/http.dart";
import "package:intl/intl.dart";
import 'dart:convert';

class world_time{
  String location="";
  String time="";
  String flag="";
  String url="";
  String day="";
  world_time({required
  this.location,
   required this.flag,
    required this.url});

  Future<void> getTime() async{
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map curtime = jsonDecode(response.body);

      DateTime now = DateTime.parse(curtime["datetime"]);
      now = now.add(Duration(hours: int.parse(curtime["utc_offset"].substring(1,3)),minutes:int.parse(curtime["utc_offset"].substring(4,6)) ));

      day = now.hour>7&&now.hour<18?"day":"night";

      time = DateFormat.jm().format(now);
    }catch(e){
      time = "couldnt fetch time";
      print(e);
    }

  }
}
