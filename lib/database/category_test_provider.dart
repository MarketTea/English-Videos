import 'package:english_videos/const/const.dart';
import 'package:sqflite/sqflite.dart';
// ignore: deprecated_member_use
import 'package:flutter_riverpod/all.dart';

class CategoryTest {
  int id;
  String name;
  String image;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTestID: id,
      columnTestName: name,
      columnTestImage: image
    };
    return map;
  }

  CategoryTest();

  CategoryTest.fromMap(Map<String, dynamic> map) {
    id = map[columnTestID];
    name = map[columnTestName];
    image = map[columnTestImage];
  }
}

class CategoryTestProvider {
  Future<CategoryTest> getCategoryById(Database database, int id) async {
    var maps = await database.query(tableCategoryTest,
        columns: [columnTestID, columnTestName, columnTestImage],
        where: '$columnTestID=?',
        whereArgs: [id]);
    if (maps.length > 0) return CategoryTest.fromMap(maps.first);
    return null;
  }

  Future<List<CategoryTest>> getCategories(Database database) async {
    var maps = await database.query(tableCategoryTest,
        columns: [columnTestID, columnTestName, columnTestImage]);
    if (maps.length > 0)
      return maps.map((e) => CategoryTest.fromMap(e)).toList();
    return null;
  }
}

class CategoryTestList extends StateNotifier<List<CategoryTest>> {
  CategoryTestList(List<CategoryTest> state) : super(state ?? []);

  void addAll(List<CategoryTest> categoryTest) {
    state.addAll(categoryTest);
  }

  void add(CategoryTest categoryTest) {
    state = [
      ...state,
      categoryTest,
    ];
  }
}
