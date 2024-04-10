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
    String img = timedata?["now"]=="day"?"https://images.pexels.com/photos/2931915/pexels-photo-2931915.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1":"https://images.pexels.com/photos/9166686/pexels-photo-9166686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  
    
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  img
              ),
              fit: BoxFit.cover,

            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,60.0,0,0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(timedata?["location"],style: TextStyle(color: timedata?["now"]=="day"?Colors.black:Colors.lightGreen,fontSize: 20.0,),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Text(
                    "${timedata?["time"]}",
                    style: TextStyle(
                        color: timedata?["now"]=="day"?Colors.black:Colors.lightGreen,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, "/chooselocation");
                    },
                      child: Text("chooselocation",style: TextStyle(color: timedata?["now"]=="day"?Colors.black:Colors.lightGreen,),)),

                ],

              ),

            ),
          ),
        ),
      ),

    );
  }
}