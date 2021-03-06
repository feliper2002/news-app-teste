import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, User>> register(String? firstName, String? lastName,
      String? email, String? password, String? passwordConfirmation) async {
    try {
      final response = await datasource.register(
          firstName, lastName, email, password, passwordConfirmation);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, User>> login(String? email, String? password) async {
    try {
      final response = await datasource.login(email, password);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccont() async {
    try {
      final response = await datasource.deleteAccount();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final response = await datasource.signOut();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
