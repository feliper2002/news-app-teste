import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/auth/domain/usecases/register.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final Register _registerUsecase;

  _RegisterControllerBase(this._registerUsecase);

  @observable
  String? firstName;

  @observable
  String? lastName;

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

  @observable
  bool? changedFirstName = false;

  @observable
  bool? changedLastName = false;

  clearAllFields() {
    firstName = '';
    lastName = '';
    email = '';
    password = '';
    setChangedFirstName(false);
    setChangedLastName(false);
    setChangedEmail(false);
    setChangedPassword(false);
  }

  @action
  setChangedFirstName(bool value) {
    changedFirstName = value;
  }

  @action
  setChangedLastName(bool value) {
    changedLastName = value;
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
  setFirstName(String? value) {
    changedFirstName = true;
    firstName = value;
  }

  @action
  setLastName(String? value) {
    changedLastName = true;
    lastName = value;
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

  String? validateFirstName() {
    if (firstName != null) {
      if (firstName!.isEmpty) {
        return 'Este campo é obrigatório!';
      }
      return null;
    }
    return 'Valor nulo';
  }

  String? validateLastName() {
    if (lastName != null) {
      if (lastName!.isEmpty) {
        return 'Este campo é obrigatório!';
      }
      return null;
    }
    return 'Valor nulo';
  }

  String? validateEmail() {
    if (email != null) {
      if (email!.isEmpty) {
        return 'Este campo é obrigatório!';
      } else if (!email!.contains('@')) {
        return 'Este e-mail é inválido!';
      }
      return null;
    }
    return 'Valor nulo';
  }

  String? validatePassword() {
    if (password != null) {
      if (password!.isEmpty) {
        return 'Este campo é obrigatório!';
      } else if (password!.length < 8) {
        return 'Senha muito curta!';
      }
      return null;
    }
    return 'Valor nulo';
  }

  String? validatePasswordConfirmation() {
    if (passwordConfirmation != null) {
      if (passwordConfirmation!.isEmpty) {
        return 'Este campo é obrigatório!';
      } else if (passwordConfirmation!.compareTo(password!) != 0) {
        return 'Confirmação de senha está diferenta da senha!';
      }
      return null;
    }
    return 'Valor nulo';
  }

  bool? validateRegisterFields() {
    return (validateEmail() == null &&
        validatePassword() == null &&
        validatePasswordConfirmation() == null &&
        validateFirstName() == null &&
        validateLastName() == null);
  }

  Future<User> register() async {
    final response = await _registerUsecase(
        firstName, lastName, email, password, passwordConfirmation);

    User? usuarioAuth;

    response.fold((exception) {
      if (exception is UnprocessableEntityFailure) {
        if (exception.errors.containsKey('e-mail')) {
          print(exception.message);
        }
        if (exception.errors.containsKey('first-name')) {
          print(exception.message);
        }
        if (exception.errors.containsKey('last-name')) {
          print(exception.message);
        }
        if (exception.errors.containsKey('password')) {
          print(exception.message);
        }
        if (exception.errors.containsKey('passwordConfirmation')) {
          print(exception.message);
        }
      } else if (exception is ServerFailure) {
        clearAllFields();
      } else if (exception is InvalidCredentials) {
        clearAllFields();
      }
    }, (user) async {
      usuarioAuth = user;
      if (usuarioAuth != null) {
        await Modular.to.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
      }
    });
    return usuarioAuth!;
  }
}
