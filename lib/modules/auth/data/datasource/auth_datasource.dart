import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/core/error/failure.dart';

abstract class AuthDatasource {
  Future<User> register(String? firstName, String? lastName, String? email,
      String? password, String? passwordConfirmation);
  Future<User> login(String? email, String? password);
  Future<void> signOut();
  Future<void> deleteAccount();
}

class AuthDatasourceNews implements AuthDatasource {
  @override
  Future<User> register(String? firstName, String? lastName, String? email,
      String? password, String? passwordConfirmation) async {
    final _auth = FirebaseAuth.instance;

    try {
      final usuario = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      await usuario.user!.updateDisplayName('$firstName $lastName');
      return usuario.user!;
    } on FirebaseAuthException catch (error) {
      Modular.to.pop();
      throw InvalidCredentials(error.message);
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível realizar o cadastro de usuário.');
    }
  }

  @override
  Future<User> login(String? email, String? password) async {
    final _auth = FirebaseAuth.instance;

    try {
      final usuario = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return usuario.user!;
    } on FirebaseAuthException catch (error) {
      throw InvalidAuthCredentials(error.message, error.code);
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível efetuar o login do usuário.');
    }
  }

  @override
  Future<void> deleteAccount() async {
    final _auth = FirebaseAuth.instance;

    try {
      final usuario = _auth.currentUser;
      await usuario!.delete();
    } on FirebaseAuthException catch (error) {
      throw InvalidAuthCredentials(error.message, error.code);
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível deletar o usuário.');
    }
  }

  @override
  Future<void> signOut() async {
    final _auth = FirebaseAuth.instance;

    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      throw InvalidAuthCredentials(error.message, error.code);
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível deslogar o usuário.');
    }
  }
}
