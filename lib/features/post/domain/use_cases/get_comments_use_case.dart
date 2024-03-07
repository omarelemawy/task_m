import 'package:dartz/dartz.dart';
import 'package:lunment_ventures/features/post/domain/entities/my_comment.dart';
import 'package:lunment_ventures/features/post/domain/entities/post.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class GetCommentsUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetCommentsUseCase({required this.baseAuthRepository});

  Future<Either<Failure, List<MyComment>>> call({required int id}) async {
    return await baseAuthRepository.getComment(id: id);
  }
}
