import "package:flutter/material.dart";
import "package:http/http.dart";
import "dart:convert";
import '../utils/world_time.dart';

class chooselocation extends StatefulWidget{
    @override
    chooselocationstate createState() {
      return chooselocationstate();
    }
}


class chooselocationstate extends State<chooselocation>{
  List AvailableLocations= [];

  void setLocations() async{

    Response response = await  get(Uri.parse("http://worldtimeapi.org/api/timezone"));
    List fetched = jsonDecode(response.body);
    setState(() {
      AvailableLocations = fetched;
    });
  }

@override
  void initState(){
    super.initState();
    setLocations();

}
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text("Choose Location",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.black87),


        body: SafeArea(child: Center(
          child:
            ListView.builder(
              itemCount: AvailableLocations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    world_time instance = world_time(location: AvailableLocations[index].split("/")[1], flag: "flag", url:AvailableLocations[index] );
                    await instance.getTime();
                    print(instance.time);
                    Navigator.pushReplacementNamed(context, "/home",arguments: {
    "location":instance.location,
    "flag":instance.flag,
    "time":instance.time,
    "now":instance.day});
                  },
                  title: Text(AvailableLocations[index],style: TextStyle(color: Colors.lightGreenAccent),),
                  tileColor: Colors.black,

                );
              },
            ),

          ),
        ),
    );
  }
}
