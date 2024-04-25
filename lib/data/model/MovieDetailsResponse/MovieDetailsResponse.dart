import 'BelongsToCollection.dart';
import 'Genres.dart';

/// adult : false
/// backdrop_path : "/hGyxHmrjnERFdt35kxXaqYmSl2Q.jpg"
/// belongs_to_collection : {"id":1070399,"name":"The Bible Collection","poster_path":"/lug8SC0acLYmSMJazoO5yjYot2a.jpg","backdrop_path":"/9H6iWrDVNJBKoFOrhUUFHt1oMlg.jpg"}
/// budget : 15000000
/// genres : [{"id":12,"name":"Adventure"},{"id":18,"name":"Drama"},{"id":10770,"name":"TV Movie"}]
/// homepage : ""
/// id : 2734
/// imdb_id : "tt0118933"
/// origin_country : ["IT","US"]
/// original_language : "en"
/// original_title : "David"
/// overview : "A distinguished military leader whose reign was touched by great scandal, shocking betrayals and rousing victories. A simple shepherd boy chosen to be king, under the watchful eyes of prophet Samuel."
/// popularity : 18.209
/// poster_path : "/6Iz8DJYiKQHZgjlq1ms4j3FQwbF.jpg"
/// production_companies : [{"id":678,"logo_path":"/AbIc38dGx4b8dhKS7oeRL6aXFDv.png","name":"Turner Network Television","origin_country":"US"},{"id":1080,"logo_path":"/6bZ0BiLDzCZSqVCjiSqweWwp9Ew.png","name":"Beta Film","origin_country":"DE"},{"id":1082,"logo_path":"/lEvojpyYkqD9W8mIEH5LB1cft2q.png","name":"Lux Vide","origin_country":"IT"},{"id":7196,"logo_path":null,"name":"Lube","origin_country":""},{"id":6370,"logo_path":null,"name":"Quinta Communications","origin_country":"FR"}]
/// production_countries : [{"iso_3166_1":"DE","name":"Germany"},{"iso_3166_1":"IT","name":"Italy"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1997-03-23"
/// revenue : 0
/// runtime : 173
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : ""
/// title : "David"
/// video : false
/// vote_average : 7.0
/// vote_count : 42

class MovieDetailsResponse {
  MovieDetailsResponse({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originCountry, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath,
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.status,
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  MovieDetailsResponse.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];


    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];

    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;

  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection?.toJson();
    }
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;

    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}