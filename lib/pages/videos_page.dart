import 'package:english_videos/database/db_helper.dart';
import 'package:english_videos/database/video_provider.dart';
import 'package:english_videos/pages/video_detail_page.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<VideoDTO>>(
        future: getVideos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image(
                            width: 100.0,
                            image: NetworkImage(snapshot.data[index].thumbUrl),
                          ),
                          title: Text(
                            snapshot.data[index].title,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(snapshot.data[index].viewCount,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text('Time: ${snapshot.data[index].time}',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.normal)),
                              ]),
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        VideoDetailPage(snapshot.data[index])));
                          },
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<VideoDTO>> getVideos() async {
    var db = await copyDB();
    var result = await VideoProvider().getVideos(db);
    //context.read(categoryListProvider).state = result;
    return result;
  }
}
