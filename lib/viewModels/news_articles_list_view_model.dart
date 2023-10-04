import 'package:flutter/material.dart';
import 'package:news_app_mvvm/models/news_article.dart';
import 'package:news_app_mvvm/services/api_service.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticle> newsArticleList = [];
  final _webservice = ApiService();

  NewsArticleListViewModel() {
    populateTopHeadlines();
  }

  void populateTopHeadlines() async {
    newsArticleList = await _webservice.fetchTopHeadLines();
    notifyListeners();
  }

  void seach(String keyword) async {
    newsArticleList = await _webservice.fetchHeadlinesByKeyword(keyword);
    notifyListeners();
  }
}
