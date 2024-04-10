import 'package:flutter/material.dart';
import '../utils/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      "now":worldtime.day,
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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitPouringHourGlassRefined(
              color: Colors.lightGreen,
              size: 50.0,
            ),
            Text("Fetching time",style: TextStyle(color:Colors.lightGreen,fontSize: 30.0),)
          ],
        )
      ),
    );
  }
}