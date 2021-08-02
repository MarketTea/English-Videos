import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_videos/database/category_provider.dart';
import 'package:english_videos/database/db_helper.dart';
import 'package:flutter/material.dart';

class PlayListPage extends StatefulWidget {
  PlayListPage({Key key}) : super(key: key);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Navigator.of(context).pop();
    //   Navigator.pushNamed(context, /homePage);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Category>>(
        future: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // if snapshot hasData, that mean categories load success
            // Category category = new Category();
            // category.id = -1;
            // category.thumbUrl = "";
            // category.title = "English TOIC";
            // snapshot.data.add(category);
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: snapshot.data.map((category) {
                return GestureDetector(
                  child: Card(
                    elevation: 2,
                    color: category.id == -1 ? Colors.green : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: AutoSizeText(
                            '${category.title}',
                            style: TextStyle(
                                color: category.id == -1
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Image(
                          width: 150.0,
                          image: NetworkImage(
                            '${category.thumbUrl}',
                          ),
                        ),
                      ],
                    ),
                  ),
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

  Future<List<Category>> getCategories() async {
    var db = await copyDB();
    var result = await CategoryProvider().getCategories(db);
    //context.read(categoryListProvider).state = result;
    return result;
  }
}
