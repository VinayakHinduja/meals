import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favourites_provider.dart';
import '../providers/filters_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories.dart';
import 'filters.dart';
import 'meal_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _currentPageIndex = 0;
  var currentTitle = 'Categories';

  void _selectPage(int int) => setState(() => _currentPageIndex = int);

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget currentPage = CategoriesScreen(availableMeals: availableMeals);

    if (_currentPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      currentPage = MealsScreen(meals: favoriteMeals);
      currentTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
