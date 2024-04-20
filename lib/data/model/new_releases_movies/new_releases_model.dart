

import '../../../domain/entities/MoviesEntity.dart';

/// adult : false
/// backdrop_path : "/j3Z3XktmWB1VhsS8iXNcrR86PXi.jpg"
/// genre_ids : [28,878,12,14]
/// id : 823464
/// original_language : "en"
/// original_title : "Godzilla x Kong: The New Empire"
/// overview : "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own."
/// popularity : 3074.956
/// poster_path : "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg"
/// release_date : "2024-03-27"
/// title : "Godzilla x Kong: The New Empire"
/// video : false
/// vote_average : 6.7
/// vote_count : 611

class NewReleasesModel {
  NewReleasesModel({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  NewReleasesModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  MoviesEntity toNewReleasesEntity(){

    return MoviesEntity(
      id: id,
      posterPath: posterPath,
      title: title,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      adult: adult,
    );

}

}