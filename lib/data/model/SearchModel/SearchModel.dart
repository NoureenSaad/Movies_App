import '../../../domain/entities/MoviesEntity.dart';

/// adult : false
/// backdrop_path : null
/// genre_ids : []
/// id : 622117
/// original_language : "es"
/// original_title : "Banda"
/// overview : "Eight musicians and their teacher travel from Santa Catarina Minas, Oaxaca to Guadalajara to study Jazz."
/// popularity : 0.6
/// poster_path : "/i8cWPIh4Z0kBbDtU6iZXpRBcJ1d.jpg"
/// release_date : "2020-09-18"
/// title : "Band"
/// video : false
/// vote_average : 0.0
/// vote_count : 0

class SearchResults {
  SearchResults({
    this.adult,
    this.backdropPath,
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

  SearchResults.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
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
  dynamic backdropPath;
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
  MoviesEntity toSearchEntity(){
    return MoviesEntity(
        title: title,
        adult: adult,
        id: id,
        originalTitle: originalTitle,
        voteAverage: voteAverage,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        backdropPath: backdropPath
    );
  }

}