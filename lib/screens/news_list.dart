import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_mvvm/viewModels/news_articles_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    context.read<NewsArticleListViewModel>().populateTopHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top News')),
      body:
          Consumer<NewsArticleListViewModel>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.newsArticleList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  value.newsArticleList[index].urlToImage,
                  height: 100,
                  width: 100,
                ),
                title: Text(value.newsArticleList[index].title),
              );
            });
      }),
    );
  }
}
