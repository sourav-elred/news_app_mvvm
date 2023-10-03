import 'package:flutter/material.dart';
import 'package:news_app_mvvm/screens/news_list_screen.dart';
import 'package:news_app_mvvm/viewModels/news_articles_list_view_model.dart';
import 'package:news_app_mvvm/viewModels/news_articles_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fresh News',
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListScreen(),
      ),
    );
  }
}
