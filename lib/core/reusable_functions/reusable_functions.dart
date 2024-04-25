class ReusableFunctions {
  static String extractYear(String dateString) {
    if(dateString == ""){
      return "";
    }
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime.year.toString();
  }

  static String getMovieClassification(bool adult) {
    if (adult) {
      return 'NC-17';
    } else {
      return 'PG-13';
    }
  }
}
