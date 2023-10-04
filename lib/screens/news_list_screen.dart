import 'package:flutter/material.dart';
import 'package:news_app_mvvm/screens/news_article_details_screen.dart';
import 'package:news_app_mvvm/viewModels/news_articles_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatelessWidget {
  NewsListScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top News')),
      body:
          Consumer<NewsArticleListViewModel>(builder: (context, value, child) {
        return Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter search term',
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      value.seach(_textEditingController.text);
                      _textEditingController.clear();
                    }
                  },
                  icon: const Icon(Icons.done),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.newsArticleList.length,
                itemBuilder: (context, index) {
                  if (value.newsArticleList.isEmpty) {
                    return const Center(child: Text('No News Found'));
                  }
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsArticleDetailsScreen(
                          article: value.newsArticleList[index],
                        ),
                      ));
                    },
                    leading: value.newsArticleList[index].urlToImage != null
                        ? Image.network(
                            value.newsArticleList[index].urlToImage!,
                            height: 100,
                            width: 100,
                          )
                        : const SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(child: Text('No Preview')),
                          ),
                    title: Text(value.newsArticleList[index].title),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
