import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:news_app/shared/classes/error_message.dart';

abstract class Register {
  Future<Either<Failure, User>> call(String? email, String? password);
}

class RegisterImpl implements Register {
  final AuthRepository repository;

  RegisterImpl(this.repository);

  @override
  Future<Either<Failure, User>> call(String? email, String? password) async {
    Map<String, dynamic> errors = {};

    if (errors.entries.isNotEmpty) {
      return Left(
        UnprocessableEntityFailure(
          ErrorMessage.invalidData,
          errors,
        ),
      );
    }

    return await repository.register(email, password);
  }
}
