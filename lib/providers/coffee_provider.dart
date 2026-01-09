import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/coffee.dart';

final coffeeProvider =
    StateNotifierProvider<CoffeeNotifier, List<Coffee>>(
  (ref) => CoffeeNotifier(),
);

class CoffeeNotifier extends StateNotifier<List<Coffee>> {
  CoffeeNotifier() : super(_initial);

  static final _initial = [
    Coffee(
      name: 'Espresso',
      description: 'Café puro e intenso',
      price: 5,
      category: 'Café',
      launchDate: DateTime(2024, 1, 1),
      imagePath: 'assets/images/espresso.jpg',
      isAssetImage: true,
    ),
    Coffee(
      name: 'Cappuccino',
      description: 'Com leite e espuma',
      price: 8.5,
      category: 'Café',
      launchDate: DateTime(2024, 2, 1),
      imagePath: 'assets/images/cappuccino.jpg',
      isAssetImage: true,
    ),
    Coffee(
      name: 'Latte',
      description: 'Suave e cremoso',
      price: 7.5,
      category: 'Café',
      launchDate: DateTime(2024, 3, 1),
      imagePath: 'assets/images/latte.jpg',
      isAssetImage: true,
    ),
    Coffee(
      name: 'Mocha',
      description: 'Com chocolate',
      price: 9,
      category: 'Café',
      launchDate: DateTime(2024, 4, 1),
      imagePath: 'assets/images/mocha.jpg',
      isAssetImage: true,
    ),
    Coffee(
      name: 'Americano',
      description: 'Diluído em água quente',
      price: 6,
      category: 'Café',
      launchDate: DateTime(2024, 5, 1),
      imagePath: 'assets/images/americano.jpg',
      isAssetImage: true,
    ),
    Coffee(
      name: 'Café Gelado',
      description: 'Refrescante',
      price: 10.5,
      category: 'Café',
      launchDate: DateTime(2024, 6, 1),
      imagePath: 'assets/images/iced_coffee.jpg',
      isAssetImage: true,
    ),
    Coffee(
      name: 'Croissant',
      description: 'Folhado amanteigado',
      price: 7,
      category: 'Lanche',
      launchDate: DateTime(2024, 7, 1),
      imagePath: 'assets/images/croissant.jpg',
      isAssetImage: true,
      glutenFree: false,
    ),
    Coffee(
      name: 'Bolo de Cenoura',
      description: 'Com cobertura de chocolate',
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
      price: 12,
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
    ),
  ];

  void add(Coffee coffee) => state = [...state, coffee];

  void remove(Coffee coffee) =>
      state = state.where((c) => c != coffee).toList();

  void toggleFavorite(Coffee coffee) {
    coffee.isFavorite = !coffee.isFavorite;
    state = [...state];
  }
}
