import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=df24e43bcf044bd5afb48716b2b71eed&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      print(articles);

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          // The request was made and the server responded with a status code
          // that falls out of the range of 2xx and is not 304.
          print('Dio Error Status Code: ${e.response?.statusCode}');
          print('Dio Error Response Data: ${e.response?.data}');
          // Extract and display the error message from the response data
          var errorMessage = e.response?.data['message'];
          print('Error Message: $errorMessage');
        } else {
          // Something went wrong while sending the request
          print('Dio Error: ${e.message}');
        }
      } else {
        // Handle other types of errors
        print('Unexpected Error: $e');
      }
      print(e.toString());
      return [];
    }
  }
}
