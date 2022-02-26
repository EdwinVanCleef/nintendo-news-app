import 'package:flutter/material.dart';
import 'package:nintendo_news_app/data/article_model.dart';
import 'package:nintendo_news_app/ui/components/article_details.dart';

Widget articleListTile(NintendoArticles source, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(
            article: source,
          ),
        ),
      );
    },
    child: Card(
      elevation: 1.5,
      margin: const EdgeInsets.fromLTRB(6, 12, 6, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(
                    source.imgSrc,
                  ),
                  height: 100,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 16)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      source.sourceArticle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Text(
                      source.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Text(
                      source.title.length > 100
                          ? '${source.title.substring(0, 100)}...'
                          : source.title,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
