/// adult : false
/// backdrop_path : "/aXPCXYFzFzdveVVk1HjVf9fHUcn.jpg"
/// genre_ids : [878,28]
/// id : 1103
/// original_language : "en"
/// original_title : "Escape from New York"
/// overview : "In a world ravaged by crime, the entire island of Manhattan has been converted into a walled prison where brutal prisoners roam. After the US president crash-lands inside, war hero Snake Plissken has 24 hours to bring him back."
/// popularity : 30.633
/// poster_path : "/yreqWiQ7IOkXWVB2Tz4LJIs7xqA.jpg"
/// release_date : "1981-05-23"
/// title : "Escape from New York"
/// video : false
/// vote_average : 7.068
/// vote_count : 2952

class SimilarModel {
  SimilarModel({
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

  SimilarModel.fromJson(dynamic json) {
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

}