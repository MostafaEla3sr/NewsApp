import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/views/article_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.articleModel}) : super(key: key);

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleView(
            article: articleModel,
            controller: WebViewController(),
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_outlined,
                      size: 32,
                      color: Colors.grey,
                    ),
                    Text(
                      'Failed to load image',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                )),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
                imageUrl: articleModel.image ??
                    'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              articleModel.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articleModel.description ??
                  'There is no details for this article...',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
