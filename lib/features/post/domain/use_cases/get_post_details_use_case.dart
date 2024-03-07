import 'package:dartz/dartz.dart';
import 'package:lunment_ventures/features/post/domain/entities/post.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class GetPostDetailsUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetPostDetailsUseCase({required this.baseAuthRepository});

  Future<Either<Failure, Post>> call({required int id}) async {
    return await baseAuthRepository.getPostDetails(id: id);
  }
}
