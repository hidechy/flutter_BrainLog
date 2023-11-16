class Article {
  Article({required this.id, required this.article});

  factory Article.fromJson(Map<String, dynamic> json) => Article(id: json['id'], article: json['article']);
  final int id;
  final String article;

  Article copyWith({int? id, String? article}) => Article(id: id ?? this.id, article: article ?? this.article);

  Map<String, dynamic> toJson() => {'id': id, 'article': article};
}
