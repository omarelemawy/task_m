import 'package:equatable/equatable.dart';

class MyComment extends Equatable {
  final int postId;

  final int id;
  final String? name;
  final String? body;
  final String? email;

  const MyComment({
    required this.postId,
    required this.id,
    this.name,
    this.body,
    this.email,
  });

  @override
  List<Object?> get props => [
        postId,
        id,
        name,
        body,
        email,
      ];
}
