import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WorkerList extends StatefulWidget {

  @override
  _WorkerListState createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  @override
  Widget build(BuildContext context) {
      const curveHeight = 25.0;
    return Scaffold(
     appBar: AppBar(
         title: Text("Worker lists"),
          centerTitle: true,
          backgroundColor: Colors.teal[500],
          shape: const MyShapeBorder(curveHeight),
        ),

        body: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 50,),
             InkWell(
              onTap: (){},
               child: Container(
                 padding: EdgeInsets.only(left: 60),
                 margin: EdgeInsets.all(25),
                 color: Color(0xFFFFFFFF),
                 child: Column(
                   children: [
                     Image.asset("assets/serviceimage/laptopreparing.png",height: 100,width:100,),
                     Text("Laptop Reparing",style: TextStyle(fontFamily: "Newsreader",fontSize: 16),),
                   ],
                 ),
               ),
             ),
              SizedBox(height: 50,),
             InkWell(
               onTap:(){ print("Container tapped");},
               child: Container(
                  padding: EdgeInsets.only(left: 60),
                  margin:  EdgeInsets.all(25),
                 color: Color(0xFFFFFFFF),
                 child: Column(
                   children: [
                     Image.asset("assets/serviceimage/tv.png",height: 100,width:100,),
                     Text("TV Reparing",style: TextStyle(fontFamily: "Newsreader",fontSize: 16),),
                   ],
                 ),
               ),
             )
           ],
         ),
        
        ),
    );
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}