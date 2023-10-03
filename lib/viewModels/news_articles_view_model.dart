import 'package:news_app_mvvm/models/news_article.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle newsArticle})
      : _newsArticle = newsArticle;

  String get title => _newsArticle.title;

  String? get description => _newsArticle.description;

  String? get imageUrl => _newsArticle.urlToImage;

  String get url => _newsArticle.url;
}
