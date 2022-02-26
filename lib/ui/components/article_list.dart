import 'package:flutter/material.dart';
import 'package:nintendo_news_app/data/article_model.dart';
import 'package:nintendo_news_app/service/article_service.dart';
import 'package:nintendo_news_app/ui/components/article_list_tile.dart';

class ArticleList extends StatefulWidget {
  final List<NintendoArticles> articles;
  final ArticleService articleService;
  final Future<List<NintendoArticles>> articleData;
  const ArticleList(this.articles, this.articleService, this.articleData,
      {Key key})
      : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  ScrollController scrollController = ScrollController();
  List<NintendoArticles> articles;
  ArticleService articleService;
  int currentPageNumber = 1;
  int totalPage = 0;

  void getData() async {
    final List<NintendoArticles> articleData =
        await articleService.getSources(currentPageNumber);

    setState(() {
      articles.addAll(articleData);
    });
  }

  @override
  void initState() {
    super.initState();
    articles = widget.articles;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        articleService = widget.articleService;
        totalPage = articleService.getPageCount();

        if (currentPageNumber < totalPage) {
          currentPageNumber++;
          getData();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return articleListTile(articles[index], context);
        },
      ),
    );
  }
}
