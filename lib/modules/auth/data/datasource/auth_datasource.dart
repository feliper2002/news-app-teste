import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/core/error/failure.dart';

abstract class AuthDatasource {
  Future<User> register(
      String? email, String? password, String? passwordConfirmation);
}

class AuthDatasourceNews implements AuthDatasource {
  @override
  Future<User> register(
      String? email, String? password, String? passwordConfirmation) async {
    final _auth = FirebaseAuth.instance;

    try {
      final usuario = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return usuario.user!;
    } on FirebaseAuthException catch (error) {
      Modular.to.pop();
      throw InvalidCredentials(error.message);
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível realizar o cadastro de usuário.');
    }
  }
}
