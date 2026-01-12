import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../models/coffee.dart';
import '../providers/coffee_provider.dart';

class AddCoffeeModal extends ConsumerStatefulWidget {
  const AddCoffeeModal({super.key});

  @override
  ConsumerState<AddCoffeeModal> createState() => _AddCoffeeModalState();
}

class _AddCoffeeModalState extends ConsumerState<AddCoffeeModal> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  String name = '';
  String description = '';
  double price = 0;
  String category = 'Café';
  DateTime? launchDate;

  bool glutenFree = true;

  String imagePath = 'assets/images/espresso.jpg';
  bool isAssetImage = true;

  Future<void> pickImage() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        imagePath = img.path;
        isAssetImage = false;
      });
    }
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() => launchDate = date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: isAssetImage
                    ? Image.asset(imagePath, height: 120, fit: BoxFit.cover)
                    : Image.file(
                        File(imagePath),
                        height: 120,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            TextButton.icon(
              icon: const Icon(Icons.image),
              label: const Text('Selecionar imagem'),
              onPressed: pickImage,
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (v) => v == null || v.isEmpty ? 'Obrigatório' : null,
              onSaved: (v) => name = v!,
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              validator: (v) => v == null || v.isEmpty ? 'Obrigatório' : null,
              onSaved: (v) => description = v!,
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
              validator: (v) =>
                  double.tryParse(v ?? '') == null || double.parse(v!) <= 0
                      ? 'Preço inválido'
                      : null,
              onSaved: (v) => price = double.parse(v!),
            ),

            DropdownButtonFormField<String>(
              initialValue: category,
              decoration: const InputDecoration(labelText: 'Categoria'),
              items: const [
                DropdownMenuItem(value: 'Café', child: Text('Café')),
                DropdownMenuItem(value: 'Lanche', child: Text('Lanche')),
                DropdownMenuItem(value: 'Sobremesa', child: Text('Sobremesa')),
                DropdownMenuItem(value: 'Chá', child: Text('Chá')),
              ],
              onChanged: (v) => category = v!,
            ),

            SwitchListTile(
              title: const Text('Sem glúten'),
              value: glutenFree,
              onChanged: (v) => setState(() => glutenFree = v),
            ),

            TextButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                launchDate == null
                    ? 'Selecionar data de lançamento'
                    : 'Lançamento: ${launchDate!.day}/${launchDate!.month}/${launchDate!.year}',
              ),
              onPressed: pickDate,
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              child: const Text('Salvar'),
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    launchDate != null) {
                  _formKey.currentState!.save();

                  ref.read(coffeeProvider.notifier).add(
                        Coffee(
                          name: name,
                          description: description,
                          price: price,
                          category: category,
                          imagePath: imagePath,
                          launchDate: launchDate!,
                          isAssetImage: isAssetImage,
                          glutenFree: glutenFree,
                        ),
                      );

                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
