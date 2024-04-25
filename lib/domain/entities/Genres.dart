// Rename the class to avoid conflicts
class MovieDetailsResponseGenres {
  MovieDetailsResponseGenres({
    this.id,
    this.name,
  });

  MovieDetailsResponseGenres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
