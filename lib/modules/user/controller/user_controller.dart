import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
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
    passwordConfirmation = '';
    setChangedEmail(false);
    setChangedPassword(false);
    setChangedPasswordConfirmation(false);
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
      }
      return null;
    }
    return 'Valor nulo';
  }
}
