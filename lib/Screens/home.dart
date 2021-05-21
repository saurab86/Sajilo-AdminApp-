import 'package:admin/Screens/gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  FSBStatus status;
  Future<bool> _onBackPressed() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.white,
              title: Text("Do you really want to exit?",style:TextStyle(fontFamily: 'SFProText') ,),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      "No",
                      style: TextStyle(fontFamily: 'Newsreader', fontSize: 17.0),
                    )),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text(
                      "Yes",
                      style: TextStyle(fontFamily: 'Newsreader', fontSize: 17.0),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Color(0xFFF3F7FB),
          //0xff392850
          appBar: AppBar(
            backgroundColor: Colors.teal[500],
               actions: [
           IconButton(
         icon: Icon(
        Icons.admin_panel_settings_outlined,
        color: Colors.white,
      ), onPressed: () {},
      )
        ],
            title: Text(
              "Admin Home",
              style: TextStyle(fontFamily: 'Newsreader',fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),

          body: SwipeDetector(
            onSwipeRight: () {
              setState(() {
                status = FSBStatus.FSB_OPEN;
              });
            },
            onSwipeLeft: () {
              setState(() {
                status = FSBStatus.FSB_CLOSE;
              });
            },
            child: FoldableSidebarBuilder(
              status: status,
              drawer: CustomDrawer(
                closeDrawer: () {
                  setState(() {
                    status = FSBStatus.FSB_CLOSE;
                  });
                },
              ),
              screenContents: Gridlist(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  status = status == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              }),
          // padding: EdgeInsets.only(top: 40.0),
          // child: Gridlist(),
        ));
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/adminicon.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sajilo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Newsreader'),
                  )
                ],
              )),
          ListTile(
            onTap: () {
            },
            leading: Icon(Icons.person),
            title: Text(
              "Your Profile",style: TextStyle(fontFamily: 'Newsreader'),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
            },
            leading: Icon(Icons.settings),
            title: Text("Settings",style: TextStyle(fontFamily: 'Newsreader'),),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
         
          ListTile(
            onTap: () {
              
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
