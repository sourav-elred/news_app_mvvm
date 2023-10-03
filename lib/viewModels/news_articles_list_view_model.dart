import 'package:flutter/material.dart';
import 'package:news_app_mvvm/services/web_service.dart';
import 'package:news_app_mvvm/viewModels/news_articles_view_model.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> newsArticleList = [];
  final _webservice = WebService();

  NewsArticleListViewModel() {
    populateTopHeadlines();
  }

  void populateTopHeadlines() async {
    final articles = await _webservice.fetchTopHeadLines();

    newsArticleList = articles
        .map((article) => NewsArticleViewModel(newsArticle: article))
        .toList();

    notifyListeners();
  }

  void seach(String keyword) async {
    final searchedArticles = await _webservice.fetchHeadlinesByKeyword(keyword);

    newsArticleList = searchedArticles
        .map((article) => NewsArticleViewModel(newsArticle: article))
        .toList();

    notifyListeners();
  }
}
