import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/coffee_list.dart';
import '../providers/filter_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/search_provider.dart';
import 'add_coffee_modal.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsiCoffee ☕'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar produto...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) =>
                  ref.read(searchProvider.notifier).state = v,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(child: Text('Configurações')),
            SwitchListTile(
              title: const Text('Somente Cafés'),
              value: ref.watch(onlyCoffeeProvider),
              onChanged: (v) =>
                  ref.read(onlyCoffeeProvider.notifier).state = v,
            ),
            SwitchListTile(
              title: const Text('Sem Glúten'),
              value: ref.watch(glutenFreeProvider),
              onChanged: (v) =>
                  ref.read(glutenFreeProvider.notifier).state = v,
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: ref.watch(themeProvider),
              onChanged: (v) =>
                  ref.read(themeProvider.notifier).state = v,
            ),
          ],
        ),
      ),
      body: const CoffeeList(showFavorites: false),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const AddCoffeeModal(),
        ),
      ),
    );
  }
}
