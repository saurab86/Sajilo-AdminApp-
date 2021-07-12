
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class VerifyAccount extends StatefulWidget {
  String currentidKey;
  VerifyAccount({this.currentidKey});
  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {

 Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('WorkerRequest');

  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("WorkerRequest");
    _ref=FirebaseDatabase.instance.reference().child("WorkerRequest").orderByChild("serviceStatus").equalTo("Verified");
  }

   Widget _buildWorkerRequest({Map workerrequest}) {
    
    return Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
                  child: Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFFFFFFF),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      height: 300,
      child: Column(
          children: [
            SizedBox(
              height: 13.0,
            ),

        ///////////////////////
          Row(
              children: [
                Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Name:",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Newsreader',
                      fontWeight: FontWeight.w400,
                      color: Colors.brown[600]),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  workerrequest['name'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
              ],
            ),
            SizedBox(height:12),

            /////////////////////////////////////
            Row(
              children: [
                Icon(
                  Icons.mail_outline,
                  size: 20,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Email:",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Newsreader',
                      fontWeight: FontWeight.w400,
                      color: Colors.brown[600]),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  workerrequest['email'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
              ],
            ),
            SizedBox(height: 12),


           ////////////////////////////
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Address:",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Newsreader',
                      fontWeight: FontWeight.w400,
                      color: Colors.brown[600]),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  workerrequest['address'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
              ],
            ),
            SizedBox(height: 12.0,),


            //////////////////////////////
            Row(
              children: [
                Icon(
                  Icons.phone_iphone_rounded,
                  size: 20,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Mobile Number:",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Newsreader',
                      fontWeight: FontWeight.w400,
                      color: Colors.brown[600]),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  workerrequest['mobilenumber'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
              ],
            ),
            SizedBox(height: 12.0),

            ////////////////////////////////////////
             Row(
            children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 16,
                        color: Colors.indigo,
                      ),
                      Icon(
                        Icons.build,
                        size: 14,
                        color: Colors.indigo,
                      ),
                      Text(
                        "Service Provider of:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            fontWeight: FontWeight.w400,
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        workerrequest['servicename'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],),
                    SizedBox(height: 15,),

                    Row(
                    children: [
                      Text("Request Status:",style: TextStyle(fontFamily: 'Newsreader',fontSize: 16)),
                      SizedBox(width: 4,),
                      Text(workerrequest['serviceStatus'],style: TextStyle(fontFamily: 'Newsreader',fontSize: 16)),
                      SizedBox(width: 5,),
                      Icon(Icons.done_all,color: Colors.blue,)
                    ],
                    
                  ) , 
                  SizedBox(height:8),

          ],
      ),
    ),
        ));}
      
  
//  String currentidKey;
//   _VerifyAccountState({this.currentidKey});
// final ref = FirebaseDatabase.instance.reference().child("WorkerRequest");
//  getValue(){
//   ref.once().then((DataSnapshot snapshot) {
//     print('Data : ${snapshot.value}');
//   });
// }

   



  @override
  Widget build(BuildContext context) {
    // getValue();
    const curveHeight = 25.0;
    return Scaffold(
      backgroundColor: Color(0xFFF3F7FB),
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        shape: const MyShapeBorder(curveHeight),
        title: Text("Verified Workers List",
            style: TextStyle(
                fontFamily: 'Newsreader', fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(7.0),
        child: FirebaseAnimatedList(
            duration: Duration(microseconds: 100),
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map workerrequest = snapshot.value;
              workerrequest['key']= snapshot.key;
              return _buildWorkerRequest(workerrequest: workerrequest);
              
            }),
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