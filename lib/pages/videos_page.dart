import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_videos/database/db_helper.dart';
import 'package:english_videos/database/video_provider.dart';
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
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: snapshot.data.map((video) {
                return GestureDetector(
                  child: Card(
                    elevation: 1,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: AutoSizeText(
                            '${video.title}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Image(
                          width: 150.0,
                          image: NetworkImage(
                            '${video.thumbUrl}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print('click here');
                  },
                );
              }).toList(),
            );
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
