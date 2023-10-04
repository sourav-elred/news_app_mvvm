import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_mvvm/models/news_article.dart';

class ApiService {
  Future<List<NewsArticle>> fetchTopHeadLines() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=dcfcdb7660da4cb3bfc441f2e19db63f";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      Iterable list = decodedJson['articles'];

      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('Failed to Fetch Top Headlines');
    }
  }

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final url =
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=dcfcdb7660da4cb3bfc441f2e19db63f";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      Iterable list = decodedJson['articles'];

      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('Failed to Fetch Top Headlines');
    }
  }
}
