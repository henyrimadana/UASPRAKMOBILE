import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  static List<Article> articles = [
    Article(
      id: '1',
      title: '',
      subtitle: '',
      body: '',
      author: '',
      authorImageUrl: '',
      category: '',
      views: 2212,
      imageUrl: '',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    )
  ];

  const Article(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.author,
      required this.authorImageUrl,
      required this.category,
      required this.imageUrl,
      required this.views,
      required this.createdAt});

  List<Object> get props => [];
}
