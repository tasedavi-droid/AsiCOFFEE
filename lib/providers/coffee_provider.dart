import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/coffee.dart';

final coffeeProvider =
    StateNotifierProvider<CoffeeNotifier, List<Coffee>>(
  (ref) => CoffeeNotifier(),
);

class CoffeeNotifier extends StateNotifier<List<Coffee>> {
  CoffeeNotifier() : super(_initialCoffees);

  static final List<Coffee> _initialCoffees = [
    Coffee(
      name: 'Espresso',
      description: 'Café puro e intenso',
      price: 5.0,
      category: 'Café',
      launchDate: DateTime(2024, 1, 1),
      imagePath: 'assets/images/espresso.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
    Coffee(
      name: 'Cappuccino',
      description: 'Com leite e espuma',
      price: 8.5,
      category: 'Café',
      launchDate: DateTime(2024, 2, 1),
      imagePath: 'assets/images/cappuccino.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
    Coffee(
      name: 'Latte',
      description: 'Suave',
      price: 7.5,
      category: 'Café',
      launchDate: DateTime(2024, 3, 1),
      imagePath: 'assets/images/latte.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
    Coffee(
      name: 'Mocha',
      description: 'Com chocolate',
      price: 9.0,
      category: 'Café',
      launchDate: DateTime(2024, 4, 1),
      imagePath: 'assets/images/mocha.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
    Coffee(
      name: 'Americano',
      description: 'Diluído',
      price: 6.0,
      category: 'Café',
      launchDate: DateTime(2024, 5, 1),
      imagePath: 'assets/images/americano.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
    Coffee(
      name: 'Café Gelado',
      description: 'Refrescante',
      price: 10.5,
      category: 'Café',
      launchDate: DateTime(2024, 6, 1),
      imagePath: 'assets/images/iced_coffee.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
    Coffee(
      name: 'Croissant',
      description: 'Folhado',
      price: 7.0,
      category: 'Lanche',
      launchDate: DateTime(2024, 7, 1),
      imagePath: 'assets/images/croissant.jpg',
      isAssetImage: true,
      glutenFree: false,
    ),
    Coffee(
      name: 'Bolo de Cenoura',
      description: 'Com chocolate',
      price: 6.5,
      category: 'Sobremesa',
      launchDate: DateTime(2024, 8, 1),
      imagePath: 'assets/images/carrot_cake.jpg',
      isAssetImage: true,
      glutenFree: false,
    ),
    Coffee(
      name: 'Sanduíche Club',
      description: 'Completo',
      price: 12.0,
      category: 'Lanche',
      launchDate: DateTime(2024, 9, 1),
      imagePath: 'assets/images/sandwich.jpg',
      isAssetImage: true,
      glutenFree: false,
    ),
    Coffee(
      name: 'Chá Matcha',
      description: 'Chá japonês',
      price: 9.5,
      category: 'Chá',
      launchDate: DateTime(2024, 10, 1),
      imagePath: 'assets/images/matcha.jpg',
      isAssetImage: true,
      glutenFree: true,
    ),
  ];



  void add(Coffee coffee) {
    state = [...state, coffee];
  }

  void remove(Coffee coffee) {
    state = state.where((c) => c != coffee).toList();
  }

  void toggleFavorite(Coffee coffee) {
    state = state
        .map(
          (c) => c == coffee
              ? c.copyWith(isFavorite: !c.isFavorite)
              : c,
        )
        .toList();
  }
}
