import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(String? firstName, String? lastName,
      String? email, String? password, String? passwordConfirmation);
  Future<Either<Failure, User>> login(String? email, String? password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> deleteAccont();
}
