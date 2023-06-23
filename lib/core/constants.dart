import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyConstants {
  static final String _myApiKey = dotenv.get("NEWS_API_KEY");
  static String apple =
      "https://newsapi.org/v2/everything?q=apple&from=2023-05-15&to=2023-05-15&sortBy=popularity&apiKey=$_myApiKey";
  static String tesla =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-04-16&sortBy=publishedAt&apiKey=$_myApiKey";

  static String headlines =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$_myApiKey";

  static String techcrunch =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_myApiKey";

  static String domains =
      " https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$_myApiKey";
}
