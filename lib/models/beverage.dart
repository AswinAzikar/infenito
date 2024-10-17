class Beverage {
  final String name;
  final String image;
  final String price;
  final String type;
  final double rating;
  final int numberOfRatings;
  final String ingredientType;
  final String description;
  final bool instantAvailability;

  Beverage({
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.rating,
    required this.numberOfRatings,
    required this.ingredientType,
    required this.description,
    required this.instantAvailability,
  });

  factory Beverage.fromJson(Map<String, dynamic> json) {
    return Beverage(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      type: json['type'],
      rating: (json['rating'] as num).toDouble(),
      numberOfRatings: json['numberOfRatings'] as int,
      ingredientType: json['ingredientType'],
      description: json['description'],
      instantAvailability: json['instantAvailability'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'type': type,
      'rating': rating,
      'numberOfRatings': numberOfRatings,
      'ingredientType': ingredientType,
      'description': description,
      'instantAvailability': instantAvailability,
    };
  }
}
