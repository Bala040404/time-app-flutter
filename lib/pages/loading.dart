import 'package:flutter/material.dart';
import '../utils/world_time.dart';

class loading extends StatefulWidget{
  @override
  loadingstate createState(){
    return loadingstate();
  }
}


class loadingstate extends State<loading>{



  void setTime() async {
    world_time worldtime= world_time(location: "kolkata",flag: "India",
    url:"Asia/kolkata");
    await worldtime.getTime();
    Navigator.pushReplacementNamed(context,"/home",arguments: {
      "location":worldtime.location,
      "flag":worldtime.flag,
      "time":worldtime.time,
    });


  }

  
  @override
  void initState(){
    super.initState();
    setTime();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("loading"),centerTitle: true,),
      body:SafeArea(child: Center(child: Text("loading time.... "))),
    );
  }
}