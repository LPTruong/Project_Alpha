import 'package:project_alpha/features/domain/entities/warning.dart';

class WarningModel extends Warning {
  const WarningModel(
      {required String id,
      required String title,
      required String content,
      required String level,
      required String category,
      required String image,
      required String createAt,
      required String author})
      : super(
            id: id,
            title: title,
            content: content,
            level: level,
            category: category,
            image: image,
            createAt: createAt,
            author: author);

  factory WarningModel.fromJson(Map<String, dynamic> json) {
    return WarningModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? 'Không xác định',
      content: json['content'] ?? 'Không xác định',
      level: json['level'] ?? 'Không xác định',
      category: json['category'] ?? 'Không xác định',
      image: json['image'] ?? '',
      createAt: json['createAt'],
      author: json['author'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'level': level,
      'category': category,
      'image': image,
      'createAt': createAt,
      'author': author,
    };
  }
}
