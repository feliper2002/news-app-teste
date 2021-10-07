import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:news_app/modules/auth/domain/usecases/register.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

main() async {
  await Firebase.initializeApp().then((value) => value);
  test('Should return User model from FirebaseAuth', () async {
    final repository = AuthRepositoryMock();
    final usecase = RegisterImpl(repository);

    final _auth = FirebaseAuth.instance;
    final usuario = await _auth.createUserWithEmailAndPassword(
        email: 'emailqualquer@teste.com', password: 'senhaqualquer');

    final user = usuario.user ?? _auth.currentUser;

    when(() => repository.register(any(), any(), any(), any(), any()))
        .thenAnswer((_) async => Right(user!));

    var result = await usecase('primeiro', 'sobrenome', 'emailqualquer',
        'senhaqualquer', 'senhaqualquer');
    expect(result.fold(id, id), isTrue);
  });
}
