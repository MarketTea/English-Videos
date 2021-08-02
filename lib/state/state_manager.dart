// ignore: deprecated_member_use
import 'package:english_videos/database/category_provider.dart';

// ignore: deprecated_member_use
import 'package:flutter_riverpod/all.dart';

final categoryListProvider =
    StateNotifierProvider((ref) => new CategoryList([]));
