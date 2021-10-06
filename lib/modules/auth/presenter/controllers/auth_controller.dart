import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/usecases/login.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final Login loginUsecase;

  _AuthControllerBase(this.loginUsecase);

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? passwordConfirmation;

  @observable
  bool? changedEmail = false;

  @observable
  bool? changedPassword = false;

  @observable
  bool? changedPasswordConfirmation = false;

  clearAllFields() {
    email = '';
    password = '';
    setChangedEmail(false);
    setChangedPassword(false);
  }

  @action
  setChangedEmail(bool value) {
    changedEmail = value;
  }

  @action
  setChangedPassword(bool value) {
    changedPassword = value;
  }

  @action
  setChangedPasswordConfirmation(bool value) {
    changedPasswordConfirmation = value;
  }

  @action
  setEmail(String? value) {
    changedEmail = true;
    email = value;
  }

  @action
  setPassword(String? value) {
    changedPassword = true;
    password = value;
  }

  @action
  setPasswordConfirmation(String? value) {
    changedPasswordConfirmation = true;
    passwordConfirmation = value;
  }

  Future<User> login(String? email, String? password) async {
    final response = await loginUsecase(email, password);

    User? usuarioAuth;

    response.fold((exception) {
      if (exception is UnprocessableEntityFailure) {
        if (exception.errors.containsKey('e-mail')) {
          print(exception.message);
        }
        if (exception.errors.containsKey('password')) {
          print(exception.message);
        }
      } else if (exception is ServerFailure) {
        clearAllFields();
      } else if (exception is InvalidCredentials) {
        clearAllFields();
      }
    }, (user) {
      usuarioAuth = user;
      print(usuarioAuth!.uid);
    });

    return usuarioAuth!;
  }
}
