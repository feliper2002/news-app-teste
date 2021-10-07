import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';

abstract class Signout {
  Future<Either<Failure, void>> call();
}

class SignoutImpl implements Signout {
  final AuthRepository repository;

  SignoutImpl(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
