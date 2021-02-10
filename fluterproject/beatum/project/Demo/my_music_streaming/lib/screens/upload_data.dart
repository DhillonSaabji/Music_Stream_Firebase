import 'dart:io';

//import 'package:firebase_admob/firebase_admob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mymusicstreaming/screens/home.dart';
import 'package:mymusicstreaming/shared/size_config.dart';
import 'package:path/path.dart';
import 'package:mymusicstreaming/main.dart';

class UploadMusic extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<UploadMusic> {
  final title = '';

//  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//    nonPersonalizedAds: true,
//  );
//
//  BannerAd _bannerAd1;
//
//  BannerAd createBannerAd() {
//    return BannerAd(
//      adUnitId: 'ca-app-pub-6665765954949461/6038232188',
//      size: AdSize.banner,
//    );
//  }

  @override
  void initState() {
//    FirebaseAdMob.instance
//        .initialize(appId: 'ca-app-pub-6665765954949461~8831916485');
//    _bannerAd1 = createBannerAd();
    super.initState();

    //show_banner_ads1();
  }

//  void show_banner_ads1() {
//    _bannerAd1
//      ..load()
//      ..show(
//        anchorOffset: 0.0,
//        anchorType: AnchorType.bottom,
//      );
//  }
  TextEditingController trackpath = TextEditingController();
  TextEditingController coverpath = TextEditingController();
  TextEditingController songname = TextEditingController();
  TextEditingController artistname = TextEditingController();
  TextEditingController artistregion = TextEditingController();
  TextEditingController songgenre = TextEditingController();
  TextEditingController artistemail = TextEditingController();
  TextEditingController artistfacebook = TextEditingController();
  TextEditingController artistinsta = TextEditingController();
  bool fillFormVisible = true, termAcceptForm = false;
  String trackPath = "",coverPath = "",songName = "",artistName = "",artistRegion = "",artistGenre = "",artistEmail = "",artistFacebook = "",artistInsta = "";
  File image, song;
  String imagepath = "Choose your cover image", songpath = 'Choose your file';
  StorageReference ref;
  var image_down_url, song_down_url;
  final firestoreinstance = FirebaseFirestore.instance;

  void selectimage() async {
    image = await FilePicker.getFile();

    setState(() {
      image = image;
      imagepath = basename(image.path);
      uploadimagefile(image.readAsBytesSync(), imagepath);
    });
  }

  Future<String> uploadimagefile(List<int> image, String imagepath) async {
    ref = FirebaseStorage.instance.ref().child(imagepath);
    StorageUploadTask uploadTask = ref.putData(image);

    image_down_url = await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  void selectsong() async {
    song = await FilePicker.getFile();

    setState(() {
      song = song;
      songpath = basename(song.path);
      uploadsongfile(song.readAsBytesSync(), songpath);
    });
  }

  Future<String> uploadsongfile(List<int> song, String songpath) async {
    ref = FirebaseStorage.instance.ref().child(songpath);
    StorageUploadTask uploadTask = ref.putData(song);

    song_down_url = await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  finalupload(context) {
    if (songname.text != '' &&
        song_down_url != null &&
        image_down_url != null) {
      print(songname.text);
      print(artistname.text);
      print(song_down_url);
      print(image_down_url.toString());

      var data = {
        "track_name": songname.text,
        "artist_name": artistname.text,
        "track_url": song_down_url.toString(),
        "cover_image_url": image_down_url.toString(),
        "artist_region": artistregion.text,
        "song_genre": songgenre.text,
        "artist_email": artistemail.text,
        "artist_facebook": artistfacebook.text,
        "artist_insta": artistinsta.text,
      };

      firestoreinstance
          .collection("allsongsdemo")
          .doc()
          .set(data)
          .whenComplete(() => showDialog(
                context: context,
                builder: (context) =>
                    _onTapButton(context, "Files Uploaded Successfully :)"),
              ));
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            _onTapButton(context, "Please Enter All Details :("),
      );
    }
  }

  _onTapButton(BuildContext context, data) {
    return AlertDialog(title: Text(data));
  }

  @override
  Widget build(BuildContext context) {
    final nextBtn = MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {

            trackPath = song_down_url.toString();
            coverPath = image_down_url.toString();
            songName = songname.text;
            artistName = artistname.text;
            artistRegion = artistregion.text;
            artistGenre = songname.text;
            artistEmail = artistemail.text;
            artistFacebook = artistfacebook.text;
            artistInsta = artistinsta.text;

            termAcceptForm = true;
            fillFormVisible = false;
          });

          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SongList()));
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
                Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )));
    final BackBtn = MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            termAcceptForm = false;
            fillFormVisible = true;
          });

          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SongList()));
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
                Text(
                  'BACK',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )));
    final SubmitBtn = MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          finalupload(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Home()));
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
                Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 27, 44, 1),
        title: Center(
            child: Text(
          title,
          style: TextStyle(color: Color.fromRGBO(24, 27, 44, 1)),
        )),
      ),
      body: Container(
        color: Color.fromRGBO(24, 27, 44, 1),
        child: Stack(
          children: [
            Container(
              child: Visibility(
                visible: fillFormVisible,
                child: ListView(
                  children: <Widget>[
//                RaisedButton(
//                  onPressed: () => selectimage(),
//                  child: Text("Select Image"),
//                ),
//                RaisedButton(
//                  onPressed: () => selectsong(),
//                  child: Text("Select Song"),
//                ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Card(
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          onTap: () => selectimage(),
                          leading: new ImageIcon(
                            new AssetImage("lib/assets/images/coverimage.png"),
                            color: Color.fromRGBO(254, 40, 81, 1),
                            size: 30,
                          ),
                          title: Text('$imagepath'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Card(
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          onTap: () => selectsong(),
                          leading: new ImageIcon(
                            new AssetImage("lib/assets/images/songsimg.png"),
                            color: Color.fromRGBO(254, 40, 81, 1),
                            size: 30,
                          ),
                          title: Text("$songpath"),
                        ),
                      ),
                    ),
//                Padding(
//                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                  child: TextField(
//                    onTap:  () => selectimage(),
//                    controller: coverpath,
//                    decoration: InputDecoration(
//                        hintText: "Choose Cover Image",
//                        filled: true,
//                        fillColor: Colors.white,
//                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                        border:
//                        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                  child: TextField(
//                    onTap:  () => selectsong(),
//
//                    controller: trackpath,
//                    decoration: InputDecoration(
//                        hintText: "Choose your file",
//                        filled: true,
//                        fillColor: Colors.white,
//                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                        border:
//                        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
//                    ),
//                  ),
//                ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: songname,
                        decoration: InputDecoration(
                            hintText: "Enter song name",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: artistname,
                        decoration: InputDecoration(
                            hintText: "Enter artist name",
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: artistregion,
                        decoration: InputDecoration(
                            hintText: "Enter artist region",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: songgenre,
                        decoration: InputDecoration(
                            hintText: "Enter artist genre",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: artistemail,
                        decoration: InputDecoration(
                            hintText: "Enter artist e-Mail",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: artistfacebook,
                        decoration: InputDecoration(
                            hintText: "Enter artist social",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: TextField(
                        controller: artistinsta,
                        decoration: InputDecoration(
                            hintText: "Enter artist social",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                    nextBtn,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Visibility(
                  visible: termAcceptForm,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 250,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Center(child: Text('Terms & Conditions')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      child: Text(
                                          ' Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Condi Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Condi Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditi')),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 300,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Center(child: Text('Your Information')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[

                                      Text(trackPath),
                                      Text(coverPath),
                                      Text(songName),
                                      Text(artistName),
                                      Text(artistRegion),
                                      Text(artistGenre),
                                      Text(artistEmail),
                                      Text(artistFacebook),
                                      Text(artistInsta),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      BackBtn,
                      SubmitBtn,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
