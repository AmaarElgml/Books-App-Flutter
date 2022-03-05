class Book {
  String? name;
  int? authorId;
  String? background;
  String? poster;
  String? price;
  String? category;

  // int? pages;
  // double? rating;

  Book({
    this.name,
    this.authorId,
    this.background,
    this.poster,
    this.price,
    this.category,
  });

  Book.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    authorId = json['author'];
    background = json['background'];
    poster = json['poster'];
    price = json['price'].toString();
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "author": authorId.toString(),
      "background": background,
      "poster": poster,
      "price": price,
      "category": category,
    };
  }
}
