import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/article_model.dart';

class WebController extends StatefulWidget {
  const WebController(
      {Key? key, required this.article, required this.controller})
      : super(key: key);

  final ArticleModel article;
  final WebViewController controller;

  @override
  State<WebController> createState() => _WebControllerState();
}

class _WebControllerState extends State<WebController> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xff000000))
      ..setNavigationDelegate(
        NavigationDelegate(

          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("ERROR");
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.article.url));
  }

  @override
  void dispose() {
    // cancel the operation when the widget is disposed of
    widget.controller.clearCache();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          )
        : WebViewWidget(
            controller: widget.controller,
          );
  }
}
