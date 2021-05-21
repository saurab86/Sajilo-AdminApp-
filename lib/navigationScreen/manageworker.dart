import 'package:admin/navigationScreen/worker_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ManageWorkerAnimationPage extends CupertinoPageRoute {
  ManageWorkerAnimationPage()
      : super(builder: (BuildContext context) => new ManageWorkerPage());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new ManageWorkerPage());
  }
}

class ManageWorkerPage extends StatefulWidget {
  @override
  _ManageWorkerPageState createState() => _ManageWorkerPageState();
}

class _ManageWorkerPageState extends State<ManageWorkerPage> {
  @override
  Widget build(BuildContext context) {
    const curveHeight = 25.0;
    return Scaffold(
        backgroundColor: Color(0xFFF3F7FB),
        appBar: AppBar(
          title: Text('Manage Worker',
              style: TextStyle(
                  fontFamily: 'Newsreader', fontWeight: FontWeight.w300)),
          centerTitle: true,
          backgroundColor: Colors.teal[500],
          shape: const MyShapeBorder(curveHeight),
        ),
        body: Center(
            child: Container(
                height: 225.0,
                margin: EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(30.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFF373737))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        //Navigator.of(context).push(WorkerReqAnimationPage());
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>WorkerRequests(),
                                transitionsBuilder: (context, animation,secondaryAnimation, child) 
                                {
                                  var begin = Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                }));
                      },
                      icon: Icon(Icons.admin_panel_settings),
                      label: Text(
                        'Handle Worker Requests',
                        style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),
                      ),
                    ),
                   // SizedBox(height: 20.0),

                    Divider(
            height: 15,
            color: Colors.grey,
          ),
                    /////////////////
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFC107))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WorkerRequests()));
                      },
                      icon: Icon(Icons.person_add_alt_1_outlined),
                      label: Text(
                        "Create worker's Account",
                        style: TextStyle(
                            fontFamily: 'Newsreader', color: Color(0xFF212121),fontSize: 18),
                      ),
                    )
                  ],
                ))));
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
