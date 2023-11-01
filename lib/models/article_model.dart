class ArticleModel {
  final String? image;
  final String title;
  final String? description;
  final String url;

  ArticleModel(
      {required this.url,
      required this.image,
      required this.title,
      required this.description});

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      url: json['url'],
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
    );
  }
}
