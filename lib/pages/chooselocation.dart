import "package:flutter/material.dart";

class chooselocation extends StatefulWidget{
    @override
    chooselocationstate createState() {
      return chooselocationstate();
    }
}


class chooselocationstate extends State<chooselocation>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("addloaction"),centerTitle: true,),
        body: SafeArea(child: Center(
          child: Column(
            children: [
              Text("choose location"),
            ],
          ),
        )),
    );
  }
}
