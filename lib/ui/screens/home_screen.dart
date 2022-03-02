import 'package:flutter/material.dart';
import 'package:nintendo_news_app/data/article_model.dart';
import 'package:nintendo_news_app/service/article_service.dart';
import 'package:nintendo_news_app/ui/components/article_list.dart';

class HomePage extends StatelessWidget {
  Future<List<NintendoArticles>> _articleData;

  @override
  Widget build(BuildContext context) {
    ArticleService articleService = ArticleService();
    _articleData = articleService.getSources(1);

    return FutureBuilder(
      future: _articleData,
      builder: (BuildContext context,
          AsyncSnapshot<List<NintendoArticles>> snapshot) {
        if (snapshot.hasError) {
          return const Text("Error Occured");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            return ArticleList(snapshot.data, articleService, _articleData);
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
