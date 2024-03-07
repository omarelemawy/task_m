import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:lunment_ventures/core/errors/exceptions.dart';
import 'package:lunment_ventures/core/errors/failures.dart';
import 'package:lunment_ventures/core/languages/app_translations.dart';
import 'package:lunment_ventures/features/post/data/models/comment_model.dart';
import 'package:lunment_ventures/features/post/data/models/post_model.dart';

import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/base_auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRespoitory implements BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRespoitory({
    required this.baseAuthRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await baseAuthRemoteDataSource.getPosts();

        return Right(data);
      } on AuthException catch (error) {
        return Left(AuthFailure(message: error.message));
      } on ValidationException catch (error) {
        return Left(ValidationFailure(message: error.message));
      } on UnVerifiedException {
        return Left(UnVerifiedFailure(message: LocaleKeys.unExpectedError.tr));
      } on UnExpectedException {
        return Left(UnExpectedFailure(message: LocaleKeys.unExpectedError.tr));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }

  @override
  Future<Either<Failure, PostModel>> getPostDetails({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await baseAuthRemoteDataSource.getPostDetails(id: id);

        return Right(data);
      } on AuthException catch (error) {
        return Left(AuthFailure(message: error.message));
      } on ValidationException catch (error) {
        return Left(ValidationFailure(message: error.message));
      } on UnVerifiedException {
        return Left(UnVerifiedFailure(message: LocaleKeys.unExpectedError.tr));
      } on UnExpectedException {
        return Left(UnExpectedFailure(message: LocaleKeys.unExpectedError.tr));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await baseAuthRemoteDataSource.deletePost(id: id);

        return Right(unit);
      } on AuthException catch (error) {
        return Left(AuthFailure(message: error.message));
      } on ValidationException catch (error) {
        return Left(ValidationFailure(message: error.message));
      } on UnVerifiedException {
        return Left(UnVerifiedFailure(message: LocaleKeys.unExpectedError.tr));
      } on UnExpectedException {
        return Left(UnExpectedFailure(message: LocaleKeys.unExpectedError.tr));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getComment(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await baseAuthRemoteDataSource.getComment(id: id);

        return Right(data);
      } on AuthException catch (error) {
        return Left(AuthFailure(message: error.message));
      } on ValidationException catch (error) {
        return Left(ValidationFailure(message: error.message));
      } on UnVerifiedException {
        return Left(UnVerifiedFailure(message: LocaleKeys.unExpectedError.tr));
      } on UnExpectedException {
        return Left(UnExpectedFailure(message: LocaleKeys.unExpectedError.tr));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }
}
