import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AsiCoffeeApp());
}

class AsiCoffeeApp extends StatelessWidget {
  const AsiCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AsiCoffee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// MODEL
class Coffee {
  final String name;
  final double price;
  final String image;
  final String category;
  final String description;

  bool isFavorite;

  Coffee({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    this.description = '',
    this.isFavorite = false,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // LISTA COMPLETA COM 10 PRODUTOS
  final List<Coffee> coffees = [
    // PRODUTOS ORIGINAIS
    Coffee(
      name: 'Espresso',
      price: 5.00,
      image: 'assets/images/espresso.jpg',
      category: 'Tradicional',
      description: 'Café puro e intenso',
    ),
    Coffee(
      name: 'Cappuccino',
      price: 8.50,
      image: 'assets/images/cappuccino.jpg',
      category: 'Cremoso',
      description: 'Café com leite vaporizado e espuma',
    ),
    Coffee(
      name: 'Latte',
      price: 7.50,
      image: 'assets/images/latte.jpg',
      category: 'Leve',
      description: 'Café suave com bastante leite',
    ),
    Coffee(
      name: 'Mocha',
      price: 9.00,
      image: 'assets/images/mocha.jpg',
      category: 'Doce',
      description: 'Café com chocolate e leite',
    ),
    Coffee(
      name: 'Americano',
      price: 6.00,
      image: 'assets/images/americano.jpg',
      category: 'Forte',
      description: 'Espresso diluído em água quente',
    ),
    
    // NOVOS PRODUTOS ADICIONADOS
    Coffee(
      name: 'Café Gelado',
      price: 10.50,
      image: 'assets/images/iced_coffee.jpg',
      category: 'Gelado',
      description: 'Café gelado com toque especial de baunilha',
    ),
    Coffee(
      name: 'Croissant de Chocolate',
      price: 7.00,
      image: 'assets/images/croissant.jpg',
      category: 'Lanches',
      description: 'Croissant folhado recheado com chocolate',
    ),
    Coffee(
      name: 'Chá Verde Matcha',
      price: 9.50,
      image: 'assets/images/matcha.jpg',
      category: 'Chás',
      description: 'Chá verde japonês com leite',
    ),
    Coffee(
      name: 'Bolo de Cenoura',
      price: 6.50,
      image: 'assets/images/carrot_cake.jpg',
      category: 'Sobremesas',
      description: 'Bolo de cenoura com cobertura de chocolate',
    ),
    Coffee(
      name: 'Sanduíche Club',
      price: 12.00,
      image: 'assets/images/sandwich.jpg',
      category: 'Lanches',
      description: 'Sanduíche com frango, bacon e vegetais',
    ),
  ];

  // Contador de favoritos
  int get favoriteCount => coffees.where((coffee) => coffee.isFavorite).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F2),
      appBar: AppBar(
        title: const Text('AsiCoffee ☕'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Cabeçalho informativo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cardápio',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade900,
                      ),
                    ),
                    Text(
                      '${coffees.length} produtos disponíveis',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                // Contador de favoritos
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        favoriteCount.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.brown.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Lista de produtos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: coffees.length,
              itemBuilder: (context, index) {
                final coffee = coffees[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // IMAGEM
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              coffee.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.brown.shade100,
                                  child: const Icon(
                                    Icons.coffee,
                                    color: Colors.brown,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // INFO DO PRODUTO
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: 
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      coffee.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.brown.shade900,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              
                              // PREÇO
                              Text(
                                'R\$ ${coffee.price.toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.brown.shade800,
                                ),
                              ),
                              
                              // DESCRIÇÃO
                              if (coffee.description.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    coffee.description,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.grey.shade600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              
                              const SizedBox(height: 6),
                              
                              // CATEGORIA
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  coffee.category,
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown.shade800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // BOTÃO DE FAVORITO
                        IconButton(
                          icon: Icon(
                            coffee.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: coffee.isFavorite 
                                ? Colors.red 
                                : Colors.grey,
                            size: 24,
                          ),
                          onPressed: () {
                            setState(() {
                              coffee.isFavorite = !coffee.isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}