import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class DeletePostUseCase {
  final BaseAuthRepository baseAuthRepository;

  DeletePostUseCase({required this.baseAuthRepository});

  Future<Either<Failure, Unit>> call({required int id}) async {
    return await baseAuthRepository.deletePost(id: id);
  }
}
