import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkerReqAnimationPage extends CupertinoPageRoute {
  //String currentKey;   //////// admin le verify click garesi tyo paticular cointair ko worker details lai key hold garna string banako
 String dbk;
  WorkerReqAnimationPage({this.dbk})
      : super(builder: (BuildContext context) => new WorkerRequests());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
   return new RotationTransition(
        turns: animation,
        child: new ScaleTransition(
          scale: animation,
          child: new FadeTransition(
            opacity: animation,
            child: new WorkerRequests(),
          ),
        ));
  }
}



class WorkerRequests extends StatefulWidget {
  @override
  _WorkerRequestsState createState() => _WorkerRequestsState();
}

class _WorkerRequestsState extends State<WorkerRequests> {
  Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('WorkerRequest');

  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("WorkerRequest");
    FirebaseDatabase.instance.reference().child("WorkerRequest");
  }

  Widget _buildWorkerRequest({Map workerrequest}) {
    if(workerrequest['serviceStatus']=='Pending'){
    
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
                      SizedBox(width:5,),
                      Icon(Icons.hourglass_bottom_sharp)
                    ],
                    
                  ) , 
                  SizedBox(height:8),

               //////////////////
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
                        child: Text('Verify Account',style: TextStyle(fontFamily: 'Newsreader'),),
                        onPressed: (){
                          _requestStatus(workerrequest: workerrequest);
                        })
                    ],
                  ) , 

                SizedBox(height: 12,),
                



                Text(workerrequest['key'])


          ],
      ),
    ),
        ));}
        else { 

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
                      SizedBox(width:5,),
                      Icon(Icons.done_all,color: Colors.blue,)
                    ],
                    
                  ) , 
                  SizedBox(height:8),
                Text(workerrequest['key'])


          ],
      ),
    ),
        ));
        }
  }

  _requestStatus({Map workerrequest}){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.blueGrey[200],
              title: new Text(
                "Verify Service Provider?",
                style: TextStyle(
                  fontFamily: 'Newsreader',
                ),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Do you want to verify this user?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      updateServiceStatus(
                          workerrequest['key'], workerrequest['serviceStatus']);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.white),
                    )),
                SizedBox(
                  width: 35.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontFamily: 'Newsreader',
                          fontSize: 16.0,
                          color: Colors.white),
                    ))
              ],
            ));  
                    }
 updateServiceStatus(String dbk, workerrequest) async{
              await reference.child('$dbk').update({'serviceStatus':'Verified'}).whenComplete(() => 
              Navigator.pop(context));
            }
  @override
  Widget build(BuildContext context) {
    const curveHeight = 25.0;
    return Scaffold(
      backgroundColor: Color(0xFFF3F7FB),
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        shape: const MyShapeBorder(curveHeight),
        title: Text("Worker's Request",
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

//Appbar Curve
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
