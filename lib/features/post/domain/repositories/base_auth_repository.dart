import 'package:dartz/dartz.dart';
import 'package:lunment_ventures/core/errors/failures.dart';
import 'package:lunment_ventures/features/post/domain/entities/my_comment.dart';
import 'package:lunment_ventures/features/post/domain/entities/post.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, Post>> getPostDetails({required int id});
  Future<Either<Failure, List<MyComment>>> getComment({required int id});
  Future<Either<Failure, Unit>> deletePost({required int id});
}
