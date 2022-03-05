enum NewsType {
  Undefined,
  Completed,
  Knowledge,
  Good,
  Bad,
}

class News {
  late String title;
  late String body;
  late String date;
  late String type;

  News(
      {required this.title,
      required this.body,
      required this.date,
      required this.type});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    date = json['date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    return {"title": title, "body": body, "date": date, "type": type};
  }
}
