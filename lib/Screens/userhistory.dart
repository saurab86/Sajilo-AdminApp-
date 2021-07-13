import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UserHistoryAnimation extends CupertinoPageRoute
{
  UserHistoryAnimation():super(builder: (BuildContext context)=> UserBookingHistory());

  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation,
     child: new UserBookingHistory());
  }
}




// ignore: must_be_immutable
class UserBookingHistory extends StatefulWidget {
  String dbk;
  UserBookingHistory({this.dbk});
  @override
  _UserBookingHistoryState createState() => _UserBookingHistoryState();
}

class _UserBookingHistoryState extends State<UserBookingHistory> {
  Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('BookingInfo');
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("BookingInfo");
    FirebaseDatabase.instance.reference().child('BookingInfo');
  }

  Widget _buildBookingItem({Map bookinginfo}) {
     if (bookinginfo['BookingStatus'] == 'Pending') {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white70,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 360.0,
          child: SafeArea(
            child: Column(
              // Text('History'),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.phone,
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
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['mobilenumber'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(height:10),
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Service Booked:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
             
                Row(
                  
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    Expanded(
                               child: Text(
                          bookinginfo['address'],
                          style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                          
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "email:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['email'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16.0,
                      ),
                      Text('Booked Time:',
                          style: TextStyle(
                              fontFamily: 'RubNewsreaderik',
                              fontSize: 16.0,
                              color: Colors.brown[600])),
                      SizedBox(width: 5),
                      Text(bookinginfo['BookedTimeAndDate'],
                          style: TextStyle(fontFamily: 'Newsreader', fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 20.0,
                    )
                  ],
                )),
                SizedBox(
                  height: 10.0,
                ),

                Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),

               
              ],
            ),
          ),
        ),
      );
    }
    
     else if(bookinginfo['serviceStatus'] == 'Completed'){
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[100],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 290.0,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //Person icon
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //Name Text
                    Text(
                      "Name:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //User Name from Databse
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      //Book icon
                      Icon(
                        Icons.book,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      Text(
                        "Service Booked:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //Service name from database
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.calendar,
                      size: 20,
                    ),
                    Text(
                      'Booked date:',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      bookinginfo['BookedTimeAndDate'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    )
                  ],
                ),
                SizedBox(height: 12),
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all_sharp,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                ),
               SizedBox(height:12),

               
                  Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['serviceStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20.0,
                    )
                  ],
                ),


                SizedBox(height:12),
                 Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5,),
                  SizedBox(height:10),

                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Text(" Service has been Sucessfully Completed! ",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18,color: Colors.green[700],
              ),),
              SizedBox(height: 8,),
              Row(children: [
                Text('Accepted by:',style: TextStyle(fontFamily: 'Newsreader',fontSize: 16),),
                SizedBox(width: 5,),
                Text(bookinginfo['AcceptedBy'],style: TextStyle(fontFamily: 'Newsreader',fontSize: 16),)
              ],)
              ],
            ),
          ),
        ),
      );
    }
    
    
    else {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 330.0,
          child: SafeArea(
            child: Column(
              // Text('History'),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                

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
                      "Mobile Number:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['mobilenumber'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Service Booked:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Address:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                                          child: Text(
                        bookinginfo['address'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "email:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['email'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.0,
                      ),
                      Text('Booked Time:',
                          style: TextStyle(
                              fontFamily: 'Newsreader',
                              fontSize: 16.0,
                              color: Colors.brown[600])),
                      SizedBox(width: 6),
                      Text(bookinginfo['BookedTimeAndDate'],
                          style: TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.done_all_rounded, color: Colors.blueAccent)
                  ],
                )),

                SizedBox(height: 10,),

                Row(
                children: [
                  Text("Service Status:",style: TextStyle(fontFamily: 'Newsreader',fontSize: 16),),
                  SizedBox(width: 4,),
                  Text(bookinginfo['serviceStatus'],style: TextStyle(fontFamily: 'Newsreader',fontSize: 16),),
                   SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 20.0,
                    )
                ],
                ),
                SizedBox(height: 5,),
                

                Row(
                  children: [
                    Text(
                      'Accepted by :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader',color: Colors.brown[600]),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                              child: Text(
                        bookinginfo['AcceptedBy'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),

                 Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                
              ],
            ),
          ),
        ),
      );
    }
  }


  

  updateRequest(String dbk, bookinginfo) async {
    await reference
        .child('$dbk')
        .update({'BookingStatus': 'Accepted'})
        .whenComplete(() => Navigator.pop(context))
        .then((value) => Fluttertoast.showToast(
            msg: "Service Accepted Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0));
    // .update(bookinginfo['BookingStatus'].toString('Accepted'))
    // .whenComplete(() => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(7.0),
        color: Colors.white,
        child: FirebaseAnimatedList(
            duration: Duration(microseconds: 100),
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map bookinginfo = snapshot.value;
              bookinginfo['key'] = snapshot.key;
              return _buildBookingItem(bookinginfo: bookinginfo);
            }),
      ),
    );
  }
}
