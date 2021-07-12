import 'package:admin/Screens/userhistory.dart';
import 'package:admin/navigationScreen/manageuser.dart';
import 'package:admin/navigationScreen/manageworker.dart';
import 'package:admin/navigationScreen/userfeedback.dart';
import 'package:flutter/material.dart';


var services = [
  "User History",
  "Manage Worker",
  "Manage User",
  "User Feedback",
];
var img = [
  "assets/userhistory.png",
  "assets/workerimage.png",
  "assets/usermgmt.png",
  "assets/feedback.png",
];

var bookingsroutes = [
  "UserBookingHistory()",
  "Notification()",
  "UserBookingHistory()",
  "Settings()"
];

class Gridlist extends StatefulWidget {
  @override
  _Gridlist createState() => _Gridlist();
}

class _Gridlist extends State<Gridlist> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: InkWell(
              splashColor: Colors.green.withAlpha(30),
              onTap: () {
                if (index == 0) {
                 // Navigator.push(context, MaterialPageRoute(builder: (_)=>UserBookingHistory()));
                  Navigator.of(context).push(UserHistoryAnimation());
                } else if (index == 1) {
                 // Navigator.push(context, MaterialPageRoute(builder: (_)=>ManageWorkerPage()));
                 Navigator.of(context).push(ManageWorkerAnimationPage());
                } else if (index == 2) {
                Navigator.of(context).push(ManageUserAnimationPage());
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>UserFeedbacks()));
                }
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Image.asset(
                      img[index],
                      height: 90,
                      fit: BoxFit.fitWidth,
                    
                    ),
                  ),
                  SizedBox(height: 4.0,),
                  Container(
                    child: Text(
                      services[index],
                      style: TextStyle(
                        fontFamily: 'Newsreader',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //SizedBox(height: 12.0),
                ],
              ),
            ),
          );
        });
  }
}
