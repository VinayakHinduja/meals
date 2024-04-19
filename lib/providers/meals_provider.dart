import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/data/meals_dummy_data.dart';

final mealsProvider = Provider((ref) => dummyMeals);
