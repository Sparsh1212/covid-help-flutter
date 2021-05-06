class Bulletin {
  final int id;
  final String title;
  final String description;
  final String link;

  Bulletin({this.id, this.title, this.description, this.link});

  factory Bulletin.fromJSON(dynamic json) {
    return Bulletin(
        id: json['pk'],
        title: json['title'],
        description: json['description'],
        link: json['link']);
  }
}
