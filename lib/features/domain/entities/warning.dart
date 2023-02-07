import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Warning extends Equatable {
  final String id;
  final String title;
  final String content;
  final String level;
  final String category;
  final String image;
  final String createAt;
  final String author;


  const Warning({
    required this.id,
    required this.title,
    required this.content,
    required this.level,
    required this.category,
    required this.image,
    required this.createAt,
    required this.author,
  });

  List<Object?> get props => [id, title, content, level, category, image, createAt, author];

}
