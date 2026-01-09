import 'dart:io';
import 'package:flutter/material.dart';
import '../models/coffee.dart';

class DetailsScreen extends StatelessWidget {
  final Coffee coffee;
  const DetailsScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffee.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGEM (asset ou galeria)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: coffee.isAssetImage
                  ? Image.asset(
                      coffee.imagePath,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(coffee.imagePath),
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
            ),

            const SizedBox(height: 16),

            Text(
              coffee.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            Text(
              coffee.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            Text(
              'Preço: R\$ ${coffee.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              'Categoria: ${coffee.category}',
            ),

            const SizedBox(height: 8),

            Text(
              'Lançamento: ${_formatDate(coffee.launchDate)}',
            ),

            if (coffee.glutenFree)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Chip(
                  label: Text('Sem glúten'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
