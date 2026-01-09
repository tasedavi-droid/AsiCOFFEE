import 'package:flutter/material.dart';
import '../widgets/coffee_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoffeeList(showFavorites: true);
  }
}
