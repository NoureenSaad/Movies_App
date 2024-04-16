/// adult : false
/// backdrop_path : "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg"
/// genre_ids : [878,12]
/// id : 693134
/// original_language : "en"
/// original_title : "Dune: Part Two"
/// overview : "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee."
/// popularity : 4661.985
/// poster_path : "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg"
/// release_date : "2024-02-27"
/// title : "Dune: Part Two"
/// video : false
/// vote_average : 8.309
/// vote_count : 2827

class PopularMoviesEntity {
  //todo: missing data from response needed in design pg and duration of movie

  PopularMoviesEntity({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  String? backdropPath;
  int? id;
  String? originalTitle;
  String? posterPath;
  String? releaseDate;
  String? title;
}
