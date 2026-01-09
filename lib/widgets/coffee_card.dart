import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/coffee.dart';
import '../providers/coffee_provider.dart';
import '../screens/details_screen.dart';

class CoffeeCard extends ConsumerWidget {
  final Coffee coffee;
  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(coffee.name),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        ref.read(coffeeProvider.notifier).remove(coffee);
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsScreen(coffee: coffee),
              ),
            );
          },
          child: Row(
            children: [
              // IMAGEM GRANDE (ESTILO ORIGINAL)
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                child: coffee.isAssetImage
                    ? Image.asset(
                        coffee.imagePath,
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(coffee.imagePath),
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffee.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        coffee.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'R\$ ${coffee.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      coffee.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: coffee.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      ref.read(coffeeProvider.notifier).toggleFavorite(coffee);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Remover produto'),
                          content: const Text(
                              'Deseja remover este item do cardápio?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(coffeeProvider.notifier)
                                    .remove(coffee);
                                Navigator.pop(context);
                              },
                              child: const Text('Remover'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
