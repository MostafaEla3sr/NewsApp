import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/web_controller.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key, required this.controller, required this.article})
      : super(key: key);

  final WebViewController controller;
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebController(
          controller: controller,
          article: article,
        ),
      ),
    );
  }
}
