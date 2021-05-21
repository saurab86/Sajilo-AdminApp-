
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class VerifyAccount extends StatefulWidget {
  String currentidKey;
  VerifyAccount({this.currentidKey});
  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
 String currentidKey;
  _VerifyAccountState({this.currentidKey});
final ref = FirebaseDatabase.instance.reference().child("WorkerRequest");
 getValue(){
  ref.once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
  });
}

   



  @override
  Widget build(BuildContext context) {
     getValue();
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify account')),
        body: Center(
          child: Column(children: [
            Row(children: [
              Text('Email'),
              SizedBox(width: 5,),
             
            ],)
          ],)
        )
    );
  }

  
}