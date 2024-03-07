import 'package:lunment_ventures/features/post/domain/entities/my_comment.dart';

class CommentModel extends MyComment {
  const CommentModel({
    required super.id,
    required super.postId,
    super.email,
    super.body,
    super.name,
  });

  factory CommentModel.fromMap(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['postId'],
      email: json['email'],
      body: json['body'],
      name: json['name'],
    );
  }
}
