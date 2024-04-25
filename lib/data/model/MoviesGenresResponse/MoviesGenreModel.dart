import 'package:movies_app/domain/entities/MoviesGenreEntity.dart';

/// id : 28
/// name : "Action"

class MoviesGenreModel {
  MoviesGenreModel({
      this.id, 
      this.name,});

  MoviesGenreModel.fromJson(dynamic json) {
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

  MoviesGenreEntity toMoviesGenreEntity(){
    return MoviesGenreEntity(
      name: name,
      id: id
    );
  }

}