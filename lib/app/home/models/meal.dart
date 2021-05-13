class Meal {
  final String mealId;
  final String vendorId;
  final String mealName;
  final String description;
  final double price;
  final String imageUrl;
  final double ratings;
  final int reviews;
  final int timeToPrep;
  final double distance;
  final String location;
  bool isFavorite;

  Meal({
    required this.mealId,
    required this.vendorId,
    required this.mealName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.timeToPrep,
    required this.distance,
    required this.location,
    this.ratings = 0,
    this.reviews = 0,
    this.isFavorite = false,
  });

  factory Meal.fromMap(Map<String, dynamic> data, String documentId) {
    final String mealName = data['mealName'];
    final String vendorId = data['vendorId'];
    final String description = data['description'];
    final double price = data['price'];
    final String imageUrl = data['imageUrl'];

    final int timeToPrep = data['timeToPrep'];
    final double distance = data['distance'];
    final String location = data['location'];

    return Meal(
      mealId: documentId,
      vendorId:vendorId,
      mealName: mealName,
      description: description,
      price: price,
      imageUrl: imageUrl,
      timeToPrep: timeToPrep,
      distance: distance,
      location: location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mealId': mealId,
      'vendorId': vendorId,
      'mealName': mealName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'timeToPrep': timeToPrep,
      'distance': distance,
      'location': location,
    };
  }
}
