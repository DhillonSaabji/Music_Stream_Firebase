import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymusicstreaming/screens/music_player.dart';



class FinalSongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<FinalSongList> {
  List<DocumentSnapshot> _list;
  final title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              title,style: TextStyle(color: Color.fromRGBO(51, 72, 86, 1)),)
        ),
        elevation: 0.0,

//        leading: InkWell(
//            child:   Padding(
//              padding: const EdgeInsets.all(15.0),
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("lib/assets/images/burgermenu.png"),
//                    fit: BoxFit.fitWidth,
//                  ),
//                ),
//              ),
//            ),
//
////            onTap: () {
////              _homeKey.currentState.openDrawer();
////            }),
////        backgroundColor: Color.fromRGBO(24, 27, 44, 1),
////        actions: <Widget>[
////          IconButton(
////              icon: Icon(Icons.notifications_none, color: Colors.white),
////              onPressed: () => Navigator.pop(context)),
////          IconButton(
////              icon: Icon(Icons.search, color: Colors.white),
////              onPressed: () => Navigator.pop(context)),
////
////        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('allnewsongs')
            .orderBy('track_name')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          Scaffold
                              .of(context)
                              .showSnackBar(SnackBar(content: Text("$index dismissed")));
                        },
                        child: buildList(context, _list[index]));
                  },
                  childCount: _list.length,
                )
            );
          }
        },
      ),
    );
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
              ))),

      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(documentSnapshot.data()["cover_image_url"],),
          ),
          title: Text(
            documentSnapshot.data()["artist_name"],
            style: TextStyle(fontSize: 20.0),
          ),
          subtitle: Text(documentSnapshot.data()["track_name"],),
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
}




//appBar: AppBar(
//title: Center(
//child: Text(
//title,style: TextStyle(color: Color.fromRGBO(51, 72, 86, 1)),)),
//elevation: 0.0,
//
//leading: InkWell(
//child:   Padding(
//padding: const EdgeInsets.all(15.0),
//child: Container(
//decoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage("lib/assets/images/burgermenu.png"),
//fit: BoxFit.fitWidth,
//),
//),
//),
//),
//
//onTap: () {
//_homeKey.currentState.openDrawer();
//}),
//backgroundColor: Color.fromRGBO(24, 27, 44, 1),
//actions: <Widget>[
//IconButton(
//icon: Icon(Icons.notifications_none, color: Colors.white),
//onPressed: () => Navigator.pop(context)),
//IconButton(
//icon: Icon(Icons.search, color: Colors.white),
//onPressed: () => Navigator.pop(context)),
//
//],
//),