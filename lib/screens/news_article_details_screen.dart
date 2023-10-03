import 'package:flutter/material.dart';
import 'package:news_app_mvvm/viewModels/news_articles_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsScreen extends StatefulWidget {
  const NewsArticleDetailsScreen({super.key, required this.article});

  final NewsArticleViewModel article;

  @override
  State<NewsArticleDetailsScreen> createState() =>
      _NewsArticleDetailsScreenState();
}

class _NewsArticleDetailsScreenState extends State<NewsArticleDetailsScreen> {
  final controller = WebViewController();

  @override
  void initState() {
    controller.loadRequest(Uri.parse(widget.article.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
