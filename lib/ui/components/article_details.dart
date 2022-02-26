import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nintendo_news_app/data/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_colors.dart';

class ArticlePage extends StatefulWidget {
  final NintendoArticles article;

  // ignore: use_key_in_widget_constructors
  const ArticlePage({this.article});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final Set<String> _favorites = <String>{};
  WebViewController _webViewController;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.sourceArticle.toUpperCase()),
        backgroundColor: AppColors.red,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: widget.article.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              const Text('Page loading...');
            },
          );
        },
      ),
      floatingActionButton: _bookmarkButton(),
    );
  }

  _bookmarkButton() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              var url = await controller.data.currentUrl();
              _favorites.add(url);
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Saved $url for later reading.')),
              );
            },
            child: const Icon(Icons.favorite),
          );
        }
        return Container();
      },
    );
  }
}
