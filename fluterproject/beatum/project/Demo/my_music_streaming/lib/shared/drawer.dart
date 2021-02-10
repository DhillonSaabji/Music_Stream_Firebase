
import 'package:flutter/material.dart';
import 'package:mymusicstreaming/screens/Login.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class MyDrawer extends StatefulWidget {

  final Widget scaffold;
  final GlobalKey<_MyDrawerState> innerDrawerKey;
  MyDrawer({
    Key key,
    this.scaffold,
    this.innerDrawerKey,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final op = MediaQuery.of(context).size;
//    final uFName = ConstantVariables.KEY_FNAME;
//   // static final uMName = ConstantVariables.KEY_MNAME;
//    final uLName = ConstantVariables.KEY_LNAME;

    return Drawer(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(24, 27, 44, 1),//rgba(Color.fromRGBO(254, 40, 81, 1))
              image: DecorationImage(
                image: AssetImage("lib/assets/images/splashbg.png"),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.only(
                right: op.height * 0.090,
                top: op.height * 0.081,
                bottom: op.height * 0.069),
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                          topRight: Radius.circular(op.height * 0.015),
                          bottomRight: Radius.circular(op.height * 0.015))),
                   color: Color.fromRGBO(16, 18, 29, 1),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            image: DecorationImage(
                              image: AssetImage("lib/assets/images/leerhximgtransparant.png"),
                              fit: BoxFit.fill,scale: 100
                            ),
                          ),
                          padding: EdgeInsets.only(left:op.height * 0.020),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    InkWell(
                                      child: new ImageIcon(
                                        new AssetImage("lib/assets/images/header_slide_menu.png"),
                                        color: Colors.white,size: 35,
                                      ),
                                      onTap: () {
                                         Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  height: op.height * 0.1000,
                                  width: op.width * 0.1700,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/images/musicbgicons.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                ),

                                //Text('abc',style: TextStyle(fontSize: 15,color: Colors.white),),
//                                InkWell(
//                                    child: Text('MY PROFILE',style: TextStyle(fontSize: 15,color: Colors.white),),
//                                  onTap: () {
////                                    Navigator.push(
////                                        context,
////                                        MaterialPageRoute(
////                                            builder: (BuildContext context) =>
////                                                Profile()));
//                                    //Navigator.pop(context);
//                                  },
//                                ),
                                Divider(
                                  // color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          // color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
//                          color: Color.fromRGBO(40, 76, 123, 1),
                          // padding: EdgeInsets.all(10),
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                leading: new ImageIcon(
                                new AssetImage("lib/assets/images/forward_arrow.png"),
                                  color: Color.fromRGBO(254, 40, 81, 1),size: 20,
                              ),
                                title: InkWell(
                                    child: Text('About US',style: TextStyle(fontSize: 20,color: Colors.white),),
                                    onTap: () {
//                                      Navigator.push(
//                                          context,
//                                          MaterialPageRoute(
//                                              builder: (BuildContext context) =>
//                                                  HomePage()));
                                      //Navigator.pop(context);
                                    },
                                        ),
                              ),
                              ListTile(
                                leading: new ImageIcon(
                                  new AssetImage("lib/assets/images/forward_arrow.png"),
                                  color: Color.fromRGBO(254, 40, 81, 1),size: 20,
                                ),
                                title: Text('Contact Us',style: TextStyle(fontSize: 20,color: Colors.white)),
                              ),
                              ListTile(
                                leading: new ImageIcon(
                                  new AssetImage("lib/assets/images/forward_arrow.png"),
                                  color: Color.fromRGBO(254, 40, 81, 1),
                                  size: 20,
                                ),
                                title: InkWell(
                                  child: Text('Admin Login',style: TextStyle(fontSize: 20,color: Colors.white)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Login()));
                                  },
                                ),
                              )
                            ],
                          ),
                          // color: Colors.orange,
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(op.height * 0.0195),
                            alignment: Alignment.topLeft,
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Terms & Conditions',style: TextStyle(fontSize: 15,color: Colors.white),),
//                                SizedBox(
//                                  height: op.height * 0.0102,
//                                ),


                                Padding(
                                  padding: const EdgeInsets.only(top:20.0),
                                  child: Text('Log Out',style: TextStyle(fontSize: 15,color: Colors.white),),
                                )
                              ],
                            ),
                            // color: Colors.pink,
                          )),
                  Container(height: 10,
                  child: WaveWidget(duration: 10,
                    config: CustomConfig(
                      gradients:[
                        [Color.fromRGBO(254, 40, 81, 1), Color(0xEEF44336)],
                        [Color.fromRGBO(254, 40, 81, 1), Color(0x66FF9800)],
                        [Color.fromRGBO(254, 40, 81, 1), Color(0x55FFEB3B)],
                      ],
                      durations: [35000, 19440, 10800],
                      heightPercentages: [0.20, 0.23, 0.25],
                      blur: MaskFilter.blur(BlurStyle.outer,10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
//                    colors: [
//                      Colors.white70,
//                      Colors.white54,
//                      Colors.white30,
//                      Colors.white24,
//                    ],

                    waveAmplitude: 0,
                    //   heightPercentages: [0.25, 0.26, 0.28, 0.31],
                    //backgroundColor: Colors.white,
                    size: Size(
                      double.infinity,
                      double.infinity,
                    ),
                  ),
                ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -1,
                  right: -1,
                  child: Container(height: 10,
                    child: WaveWidget(duration: 10,
                      config: CustomConfig(
                        gradients:[
                          [Color.fromRGBO(254, 40, 81, 1), Color(0xEEF44336)],
                          [Colors.orange, Color(0x66FF9800)],
                          [Colors.blue, Color(0x55FFEB3B)],
                        ],
                        durations: [35000, 19440, 10800],
                        heightPercentages: [0.20, 0.23, 0.25],
                        blur: MaskFilter.blur(BlurStyle.outer,10),
                        gradientBegin: Alignment.bottomLeft,
                        gradientEnd: Alignment.topRight,
                      ),
//                    colors: [
//                      Colors.white70,
//                      Colors.white54,
//                      Colors.white30,
//                      Colors.white24,
//                    ],

                      waveAmplitude: 0,
                      //   heightPercentages: [0.25, 0.26, 0.28, 0.31],
                      //backgroundColor: Colors.white,
                      size: Size(
                        double.infinity,
                        double.infinity,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ));
  }
}
