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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 65.0,
                      child: Text(
                        source.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Text(
                      source.sourceArticle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 16)),
              ClipRRect(
                child: Image(
                  image: NetworkImage(
                    source.imgSrc,
                  ),
                  height: 85,
                  width: 110,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
