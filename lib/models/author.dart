class Author {
  late String name;
  late String? image;
  late String booksNum;

  Author({required this.name, required this.image, required this.booksNum});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    booksNum = json['booksNum'];
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "image": image, "booksNum": booksNum};
  }
}
