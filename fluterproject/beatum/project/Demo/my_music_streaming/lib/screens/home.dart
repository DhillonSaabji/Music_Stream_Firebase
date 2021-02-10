import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymusicstreaming/screens/music_player.dart';
import 'package:mymusicstreaming/screens/song_list.dart';
import 'package:mymusicstreaming/screens/upload_data.dart';
import 'package:mymusicstreaming/shared/drawer.dart';
import 'package:mymusicstreaming/shared/size_config.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Home extends StatefulWidget {
  bool adminLogin;
  Home({this.adminLogin});
  @override
  __HomeScreenState createState() => __HomeScreenState();
}

class __HomeScreenState extends State<Home> {
  List<DocumentSnapshot> _list;
  var i = "";
  final title = '';
  bool isAdminLogin = false;
  final _homeKey = new GlobalKey<ScaffoldState>();
  bool listVisible = false, dashBoardVisible = true;
  initState() {
    if (widget.adminLogin != null) {
      isAdminLogin = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final slider = SleekCircularSlider(
      max: 1000,
      //initialValue: 426,
      appearance: CircularSliderAppearance(
        spinnerMode: true,
      ),
      onChange: (double value) {
        // callback providing a value while its being changed (with a pan gesture)
      },
      onChangeStart: (double startValue) {
        // callback providing a starting value (when a pan gesture starts)
      },
      onChangeEnd: (double endValue) {
        // ucallback providing an ending value (when a pan gesture ends)
      },
      innerWidget: (double value) {
        // use your custom widget inside the slider (gets a slider value from the callback)
        SizedBox(
          height: displayHeight(context) * 0.3,
          child: Image.asset(
            "lib/assets/images/dashboardimg.png",
            fit: BoxFit.contain,
          ),
        );
        return SizedBox();
      },
    );
    final uploadMusicbtn = MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
        onPressed: () {
          //authenticate(userNameControler.text,passwordControler.text);
          // getUser(userNameControler.text,passwordControler.text);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => UploadMusic()));
        },
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: LinearGradient(
                      colors: [
                        Colors.red[200],
                        Colors.red[200],
                        Colors.red[300],
                        Colors.red[400],
                        Colors.red[500],
                        Colors.red[400],
                        Colors.red[300],
                        Colors.red[200],
                        Colors.red[100],
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[800],
                        offset: Offset(0.0, 1.5),
                        blurRadius: 12,
                      ),
                    ]),
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: displayHeight(context) * 0.01),
                    Image.asset(
                      "lib/assets/images/uploadicon.png",
                      fit: BoxFit.contain,
                      height: displayHeight(context) * 0.04,
                      width: displayHeight(context) * 0.04,
                    ),
                    SizedBox(width: displayHeight(context) * 0.01),
                    Text(
                      'UPLOAD MUSIC',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )),
          ],
        ));

    final listenMusicBtn = MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => SongList()));
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              gradient: LinearGradient(
                colors: [
                  Colors.red[200],
                  Colors.red[300],
                  Colors.red[300],
                  Colors.red[400],
                  Colors.red[500],
                  Colors.red[400],
                  Colors.red[300],
                  Colors.red[200],
                  Colors.red[100],
                ],
              ),
            ),
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "lib/assets/images/songlistenicon.png",
                  fit: BoxFit.contain,
                  height: displayHeight(context) * 0.04,
                  width: displayHeight(context) * 0.04,
                ),
                SizedBox(width: displayHeight(context) * 0.01),
                Text(
                  'LISTEN TO MUSIC',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )));

    return Scaffold(
        key: _homeKey,
        appBar: AppBar(
          title: Center(
              child: Text(
            title,
            style: TextStyle(color: Color.fromRGBO(51, 72, 86, 1)),
          )),
          elevation: 0.0,
          leading: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/images/burgermenu.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              onTap: () {
                _homeKey.currentState.openDrawer();
              }),
          backgroundColor: Color.fromRGBO(24, 27, 44, 1),
          actions: <Widget>[
            Visibility(
              visible: isAdminLogin,
              child: Stack(
                children: [
                  IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.notifications_none, color: Colors.white),
                      onPressed: () {
                        onPressVisible();
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (BuildContext context) => SongList()));
                      }),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: IconButton(
                      onPressed: () {
                        onPressVisible();
                      },
                      icon: Stack(children: [
                        Icon(Icons.circle, color: Colors.redAccent),
                        Positioned(
                            top: 3,
                            right: 3,
                            child: Text(
                              "12",
                              //listcount(),
                              style: TextStyle(fontSize: 8),
                            )),
                      ]),
                      iconSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () => Navigator.pop(context)),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              // color: Colors.white60,
              color: Color.fromRGBO(24, 27, 44, 1),
              image: new DecorationImage(
                  image: new AssetImage("lib/assets/images/splashbg.png"),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: -1,
                left: -1,
                child: Visibility(
                  visible: dashBoardVisible,
                  child: Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: displayHeight(context) * 0.3,
                              child: Image.asset(
                                "lib/assets/images/dashboardimg.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            // slider,

                            SizedBox(height: displayHeight(context) * .03),

                            uploadMusicbtn,
                            listenMusicBtn,
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                height: 800,
                left: -1,
                right: -1,
                top: 10,
                child: Visibility(
                  visible: listVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('allnewsongs')
                          .orderBy('track_name')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          _list = snapshot.data.docs;

                          String item;
                          return ListView.custom(
                              childrenDelegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Dismissible(
                                  background: Container(color: Colors.red),
                                  key: Key(item),
                                  onDismissed: (direction) {
                                    setState(() {
                                      _list.removeAt(index);
                                    });
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("$index dismissed")));
                                  },
                                  child: buildList(context, _list[index]));
                            },
                            childCount: _list.length,
                          ));
                        }
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -1,
                left: -1,
                child: Column(
                  children: <Widget>[
                    WaveWidget(
                        duration: 5,
                        config: CustomConfig(
                          gradients: [
                            [
                              Color.fromRGBO(254, 40, 81, 1),
                              Color.fromRGBO(254, 40, 81, 1)
                            ],
                            [
                              Color.fromRGBO(254, 40, 81, 1),
                              Color.fromRGBO(254, 40, 81, 1)
                            ],
                            [
                              Color.fromRGBO(254, 40, 81, 1),
                              Color.fromRGBO(254, 40, 81, 1)
                            ],
                            [
                              Color.fromRGBO(254, 40, 81, 1),
                              Color.fromRGBO(254, 40, 81, 1)
                            ],
                          ],
                          durations: [35000, 20440, 40800, 50000],
                          heightPercentages: [0.20, 0.23, 0.25, 0.30],
                          blur: MaskFilter.blur(BlurStyle.inner, 15),
                          gradientBegin: Alignment.bottomLeft,
                          gradientEnd: Alignment.bottomLeft,
                        ),
                        // waveAmplitude: 1.0,
                        backgroundColor: Colors.transparent,
                        size: Size(double.infinity, 100.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: SafeArea(
            child: Container(width: double.infinity, child: MyDrawer())));
  }

  Widget buildList(BuildContext context, DocumentSnapshot documentSnapshot) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Musicplayer(
                    song_name: documentSnapshot.data()["track_name"],
                    artist_name: documentSnapshot.data()["artist_name"],
                    song_url: documentSnapshot.data()["track_url"],
                    image_url: documentSnapshot.data()["cover_image_url"],
                    its_admin: true,
                  ))),
      child: Card(
        color: Colors.black12,
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              documentSnapshot.data()["cover_image_url"],
            ),
          ),
          title: Text(
            documentSnapshot.data()["artist_name"],
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
          subtitle: Text(
            documentSnapshot.data()["track_name"],
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          ),
          dense: true,
          trailing: Icon(Icons.delete),
//          onTap: () {
//            // this will not get called
//          },
        ),
        elevation: 10.0,
      ),
    );
  }

  void onPressVisible() async {
    await setState(() {
      dashBoardVisible = false;
      listVisible = true;
    });
  }

  Future listcount() async {
    await setState(() {
      int j = _list.length;
      var j2 = j;
      i = j2 as String;
      return i;
    });
  }
}
