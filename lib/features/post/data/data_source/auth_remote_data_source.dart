import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lunment_ventures/core/consts/api_urls.dart';
import 'package:lunment_ventures/features/post/data/models/comment_model.dart';
import 'package:lunment_ventures/features/post/data/models/post_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/languages/app_translations.dart';

abstract class BaseAuthRemoteDataSource {
  Future<PostModel> getPostDetails({required int id});
  Future<List<PostModel>> getPosts();
  Future<List<CommentModel>> getComment({required int id});
  Future<Unit> deletePost({required int id});
}

class AuthRemoteDataSource extends GetConnect
    implements BaseAuthRemoteDataSource {
  // final BaseAuthLocalDataSource baseAuthLocalDataSource;

  AuthRemoteDataSource();

  @override
  Future<List<PostModel>> getPosts() async {
    final dio = Dio();
    final response = await dio.get(
      ApiUrls.getPosts,
    );

    print(response.data);

    switch (response.statusCode) {
      case 200:
        return (response.data as List)
            .map((e) => PostModel.fromMap(e))
            .toList();
      case 203:
        throw ExpiredPlanException(message: response.data['msg'], result: null);
      case 401:
        throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);

      case 400:
      case 422:
        throw ValidationException(message: response.data['msg']);
      default:
        throw ServerException();
    }
  }

  @override
  Future<PostModel> getPostDetails({required int id}) async {
    final dio = Dio();
    final response = await dio.get(
      "${ApiUrls.getPostDetails}$id",
    );

    print(response.data);

    switch (response.statusCode) {
      case 200:
        return PostModel.fromMap(response.data);
      case 203:
        throw ExpiredPlanException(message: response.data['msg'], result: null);
      case 401:
        throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);

      case 400:
      case 422:
        throw ValidationException(message: response.data['msg']);
      default:
        throw ServerException();
    }
  }

  @override
  Future<List<CommentModel>> getComment({required int id}) async {
    final dio = Dio();
    final response = await dio.get(
      "${ApiUrls.getPostDetails}$id/comments",
    );

    print(response.data);

    switch (response.statusCode) {
      case 200:
        return (response.data as List)
            .map((e) => CommentModel.fromMap(e))
            .toList();
      case 203:
        throw ExpiredPlanException(message: response.data['msg'], result: null);
      case 401:
        throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);

      case 400:
      case 422:
        throw ValidationException(message: response.data['msg']);
      default:
        throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost({required int id}) async {
    final dio = Dio();
    final response = await dio.delete(
      "${ApiUrls.getPostDetails}$id",
    );

    print(response.data);

    switch (response.statusCode) {
      case 200:
        return unit;
      case 203:
        throw ExpiredPlanException(message: response.data['msg'], result: null);
      case 401:
        throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);

      case 400:
      case 422:
        throw ValidationException(message: response.data['msg']);
      default:
        throw ServerException();
    }
  }
}
