import "package:flutter/material.dart";

class home extends StatefulWidget{
  @override
  homestate createState(){
    return homestate();
  }
}

class homestate extends State<home>{
  Map ?timedata;
  @override
  Widget build (BuildContext context){
    timedata = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      centerTitle:true,),
      body: SafeArea(
        child: Center(
          child: Column(

            children: [
              Text(
                "${timedata?["time"]}"
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, "/chooselocation");

                },
                  child: Text("chooselocation"))
            ],
          ),
        ),
      ),
    );
  }
}