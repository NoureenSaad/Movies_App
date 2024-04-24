import 'package:movies_app/data/model/MovieDetailsResponse/Genres.dart';

/// adult : false
/// backdrop_path : "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg"
/// genre_ids : [18,80]
/// id : 278
/// original_language : "en"
/// original_title : "The Shawshank Redemption"
/// overview : "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope."
/// popularity : 123.237
/// poster_path : "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg"
/// release_date : "1994-09-23"
/// title : "The Shawshank Redemption"
/// video : false
/// vote_average : 8.704
/// vote_count : 26002

class MoviesEntity {
  MoviesEntity({
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
      this.voteCount,
      this.isFavorite = false,
      List<Genres>? genres,
  });


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
  bool? isFavorite;


  MoviesEntity.fromFirestore(Map<String , dynamic> data){
    id = data["id"];
    title = data["title"];
    backdropPath = data["backdropPath"];
    releaseDate = data["releaseDate"];
    isFavorite = data["isFavorite"];
    posterPath = data["posterPath"];
    voteAverage = data["voteAverage"];
  }

  Map<String , dynamic> toFirstore(){
    Map<String , dynamic> data = {
      "id":id,
      "title":title,
      "backdropPath":backdropPath,
      "releaseDate":releaseDate,
      "isFavorite":isFavorite,
      "posterPath":posterPath,
      "voteAverage":voteAverage
    };
    return data;
  }

}