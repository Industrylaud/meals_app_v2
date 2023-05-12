import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_v2/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
