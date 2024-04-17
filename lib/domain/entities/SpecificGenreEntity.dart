/// adult : false
/// backdrop_path : "/rKmp0vm6PNaFA0g1bzM70eyWJ6I.jpg"
/// genre_ids : [28]
/// id : 873972
/// original_title : "Hunters"
/// overview : "As John T. Wrecker continues his task of protecting a group of refugees from a virus, the threat of something new and even more dangerous grows ever closer in the form of monstrous mutants."
/// poster_path : "/3UKlVa1CBeQkRksHV5OfFTO52qd.jpg"
/// release_date : "2021-09-13"
/// title : "Hunters"
/// vote_average : 6.353

class SpecificGenreEntity {
  SpecificGenreEntity({
      this.adult, 
      this.genreIds,
      this.id, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.voteAverage,});


  bool? adult;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
}