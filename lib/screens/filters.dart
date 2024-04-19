import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          Shit(
            title: 'Gluten-free',
            subtitle: 'gluten-free',
            varaible: activeFilters[Filter.glutenfree]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenfree, value),
          ),
          Shit(
            title: 'Lactose-free',
            subtitle: 'lactose-free',
            varaible: activeFilters[Filter.lactosefree]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactosefree, value),
          ),
          Shit(
            title: 'Vegetarian',
            subtitle: 'vegetarian',
            varaible: activeFilters[Filter.vegetarian]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, value),
          ),
          Shit(
            title: 'Vegan',
            subtitle: 'vegan',
            varaible: activeFilters[Filter.vegan]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, value),
          ),
        ],
      ),
    );
  }
}

class Shit extends StatelessWidget {
  const Shit({
    super.key,
    required this.title,
    required this.subtitle,
    required this.varaible,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool varaible;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: varaible,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        'Only include $subtitle meals',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
