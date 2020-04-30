

class Constants {

  static String TOP_HEADLINES_URL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0dcddfea904e47518a20b37072a7a97d";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=0dcddfea904e47518a20b37072a7a97d";
  }


}