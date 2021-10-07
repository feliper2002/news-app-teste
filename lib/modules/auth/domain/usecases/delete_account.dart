import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';

abstract class DeleteAccont {
  Future<Either<Failure, void>> call();
}

class DeleteAccontImpl implements DeleteAccont {
  final AuthRepository repository;

  DeleteAccontImpl(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.deleteAccont();
  }
}
