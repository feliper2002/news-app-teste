import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:news_app/shared/classes/error_message.dart';

abstract class Login {
  Future<Either<Failure, User>> call(String? email, String? password);
}

class LoginImpl implements Login {
  final AuthRepository repository;

  LoginImpl(this.repository);

  @override
  Future<Either<Failure, User>> call(String? email, String? password) async {
    Map<String, dynamic> errors = {};

    if (email!.isEmpty) {
      errors.putIfAbsent('email', () => 'O campo de e-mail é obrigatório!');
    } else if (!email.contains('@')) {
      errors.putIfAbsent('email', () => 'Este endereço de e-mail é inválido!');
    }

    if (password!.isEmpty) {
      errors.putIfAbsent('password', () => 'O campo de senha é obrigatório!');
    }

    if (errors.entries.isNotEmpty) {
      return Left(
        UnprocessableEntityFailure(
          ErrorMessage.invalidData,
          errors,
        ),
      );
    }

    return await repository.login(email, password);
  }
}
