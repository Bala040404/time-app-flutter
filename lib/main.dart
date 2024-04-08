import 'package:flutter/material.dart';
import 'package:worldtime/pages/chooselocation.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';


void main(){
  runApp(app());
}

class app extends StatefulWidget{
  @override
  appstate createState(){
    return appstate();
  }
}



class appstate extends State<app>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        "/home":(context)=>home(),
        "/chooselocation":(context)=>chooselocation(),
        "/":(context)=>loading()

      },
      // initialRoute: "/home",
    );
  }
}