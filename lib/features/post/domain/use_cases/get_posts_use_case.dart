import 'package:dartz/dartz.dart';
import 'package:lunment_ventures/features/post/domain/entities/post.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class GetPostsUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetPostsUseCase({required this.baseAuthRepository});

  Future<Either<Failure, List<Post>>> call() async {
    return await baseAuthRepository.getPosts();
  }
}
