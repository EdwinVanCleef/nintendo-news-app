class NintendoArticles {
  String title;
  String url;
  String sourceArticle;
  String imgSrc;
  String summary;

  NintendoArticles(
      this.title, this.url, this.sourceArticle, this.imgSrc, this.summary);

  factory NintendoArticles.fromJson(dynamic json) {
    return NintendoArticles(
      json['title'] as String,
      json['url'] as String,
      json['source'] as String,
      json['imgSrc'] as String,
      json['summary'] as String,
    );
  }

  @override
  String toString() {
    return '{ $title, $url, $sourceArticle, $imgSrc, $summary }';
  }
}
