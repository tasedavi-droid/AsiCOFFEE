import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/coffee_provider.dart';
import '../providers/filter_provider.dart';
import '../providers/search_provider.dart';
import 'coffee_card.dart';
import 'empty_state.dart';

class CoffeeList extends ConsumerWidget {
  final bool showFavorites;
  const CoffeeList({super.key, required this.showFavorites});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coffees = ref.watch(coffeeProvider);
    final onlyCoffee = ref.watch(onlyCoffeeProvider);
    final glutenFree = ref.watch(glutenFreeProvider);
    final search = ref.watch(searchProvider).toLowerCase();

    final filtered = coffees.where((c) {
      if (showFavorites && !c.isFavorite) return false;
      if (onlyCoffee && c.category != 'Café') return false;
      if (glutenFree && !c.glutenFree) return false;
      if (search.isNotEmpty &&
          !c.name.toLowerCase().contains(search)) return false;
      return true;
    }).toList();

    if (filtered.isEmpty) return const EmptyState();

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (_, i) => CoffeeCard(coffee: filtered[i]),
    );
  }
}
