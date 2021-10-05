import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:news_app/shared/classes/error_message.dart';

abstract class Register {
  Future<Either<Failure, User>> call(
      String? email, String? password, String? passwordConfirmation);
}

class RegisterImpl implements Register {
  final AuthRepository repository;

  RegisterImpl(this.repository);

  @override
  Future<Either<Failure, User>> call(
      String? email, String? password, String? passwordConfirmation) async {
    Map<String, dynamic> errors = {};

    if (email!.isEmpty) {
      errors.putIfAbsent('email', () => 'O campo de e-mail é obrigatório!');
    } else if (!email.contains('@')) {
      errors.putIfAbsent('email', () => 'Este endereço de e-mail é inválido!');
    }

    if (password!.isEmpty) {
      errors.putIfAbsent('password', () => 'O campo de senha é obrigatório!');
    }

    if (passwordConfirmation!.isEmpty) {
      errors.putIfAbsent('passwordConfirmation',
          () => 'O campo de confirmação de senha é obrigatório!');
    } else if (passwordConfirmation.compareTo(password) != 0) {
      errors.putIfAbsent(
          'passwordConfirmation',
          () =>
              'O campo de confirmação de senha deve ser igual ao campo de senha!');
    }

    if (errors.entries.isNotEmpty) {
      return Left(
        UnprocessableEntityFailure(
          ErrorMessage.invalidData,
          errors,
        ),
      );
    }

    return await repository.register(email, password, passwordConfirmation);
  }
}
