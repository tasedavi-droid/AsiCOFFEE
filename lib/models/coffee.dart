class Coffee {
  final String name;
  final String description;
  final double price;
  final String category;
  final DateTime launchDate;

  final String imagePath;
  final bool isAssetImage;

  final bool glutenFree;
  final bool isFavorite;

  Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.launchDate,
    required this.imagePath,
    required this.isAssetImage,
    this.glutenFree = false,
    this.isFavorite = false,
  });

  Coffee copyWith({
    bool? isFavorite,
  }) {
    return Coffee(
      name: name,
      description: description,
      price: price,
      category: category,
      launchDate: launchDate,
      imagePath: imagePath,
      isAssetImage: isAssetImage,
      glutenFree: glutenFree,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
