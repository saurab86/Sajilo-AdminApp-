import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ManageUserAnimationPage extends CupertinoPageRoute {
  ManageUserAnimationPage()
      : super(builder: (BuildContext context) => new ManageUserPage());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new ManageUserPage());
  }
}

class ManageUserPage extends StatefulWidget {
  @override
  _ManageUserPageState createState() => _ManageUserPageState();
}

class _ManageUserPageState extends State<ManageUserPage> {

   Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('UserProfile');

  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("UserProfile");
    FirebaseDatabase.instance.reference().child("UserProfile");
  }

Widget _buildUserprofile({Map userprofile}){
  
  return Container(
   child:  SingleChildScrollView(child: 
   Container(
     width: MediaQuery.of(context).size.width,
      color: Color(0xFFFFFFFF),
       margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      height: 250,
      child: Column(
        children:[

           CircleAvatar(
                  radius:40,
                  child: ClipOval(
                      child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child:Image.network(userprofile['profilepic'],
                          fit: BoxFit.fill,),
               ),
                  ),
                ),

                SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  userprofile['Name'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
                SizedBox(width:10),
                 ],
            ),
            SizedBox(height:12),


            Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Icon(
                  Icons.location_city,
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
                  userprofile['Address'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
                SizedBox(width:10),
                 ],
            
            ),
              SizedBox(height:10),
            
            
            Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Icon(
                  Icons.location_city,
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
                  userprofile['Ward'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
                SizedBox(width:10),
                 ],
            
            ),




            SizedBox(height:10),

            
            Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Icon(
                  Icons.phone_iphone,
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
                  userprofile['MobileNumber'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
                SizedBox(width:10),
                 ],
            
            ),
            SizedBox(height:10),

            Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Text(
                  "Uid:",
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
                  userprofile['UserID'],
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                ),
                SizedBox(width:10),
                 ],
            
            )
        ]
      ),

   ),),
  );
}

  @override
  Widget build(BuildContext context) {
    const curveHeight = 25.0;
    return Scaffold(
        backgroundColor: Color(0xFFF3F7FB),
        appBar: AppBar(
          title: Text('Manage User',
              style: TextStyle(
                  fontFamily: 'Newsreader', fontWeight: FontWeight.w300)),
          centerTitle: true,
          backgroundColor: Colors.teal[500],
          shape: const MyShapeBorder(curveHeight),
        ),
        
         body: Container(
        margin: const EdgeInsets.all(7.0),
        child: FirebaseAnimatedList(
            duration: Duration(microseconds: 100),
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map userprofile = snapshot.value;
              userprofile['key']= snapshot.key;
              return _buildUserprofile(userprofile: userprofile);
              
            }),
      )
        );
        
  }
}

//AppBar Curve Class
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
