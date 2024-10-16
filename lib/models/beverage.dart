class Beverage {
  final String name;
  final String image;
  final String price;
  final String type;
  final double rating;
  final int numberOfRatings; 

  Beverage({
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.rating,
    required this.numberOfRatings, 
  });

  factory Beverage.fromJson(Map<String, dynamic> json) {
    return Beverage(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      type: json['type'],
      rating: (json['rating'] as num).toDouble(),
      numberOfRatings: json['numberOfRatings'] as int, 
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
    };
  }
}
