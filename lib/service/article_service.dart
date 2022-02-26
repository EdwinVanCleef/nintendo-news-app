import 'dart:convert';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:nintendo_news_app/data/article_model.dart';

class ArticleService {
  int page;
  int pageCount;

  List<NintendoArticles> parseSources(var res) {
    final parsed = res;
    return parsed
        .map<NintendoArticles>((json) => NintendoArticles.fromJson(json))
        .toList();
  }

  int getCurrentPage() {
    return page;
  }

  void setCurrentPage(currentPage) {
    page = currentPage;
  }

  int getPageCount() {
    return pageCount;
  }

  Future<List<NintendoArticles>> getSources(int pageCnt) async {
    String apiKey = "9762abf28bmsh0944bb0a0d6f9b5p19d503jsn486b0cf6d273";
    String url = "https://nintendo-news1.p.rapidapi.com/news?rapidapi-key=" +
        apiKey +
        "&p=" +
        pageCnt.toString();

    final res = await http.get(url);

    if (res.statusCode == 200) {
      var articles =
          json.decode(res.body)["articles"].cast<Map<String, dynamic>>();

      page = json.decode(res.body)["page"];
      pageCount = json.decode(res.body)["pageCount"];

      return parseSources(articles);
    } else {
      throw Exception('Cannot get response');
    }
  }
}
