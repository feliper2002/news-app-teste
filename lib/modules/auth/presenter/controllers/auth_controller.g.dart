// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$emailAtom = Atom(name: '_AuthControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordConfirmationAtom =
      Atom(name: '_AuthControllerBase.passwordConfirmation');

  @override
  String? get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String? value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  final _$changedEmailAtom = Atom(name: '_AuthControllerBase.changedEmail');

  @override
  bool? get changedEmail {
    _$changedEmailAtom.reportRead();
    return super.changedEmail;
  }

  @override
  set changedEmail(bool? value) {
    _$changedEmailAtom.reportWrite(value, super.changedEmail, () {
      super.changedEmail = value;
    });
  }

  final _$changedPasswordAtom =
      Atom(name: '_AuthControllerBase.changedPassword');

  @override
  bool? get changedPassword {
    _$changedPasswordAtom.reportRead();
    return super.changedPassword;
  }

  @override
  set changedPassword(bool? value) {
    _$changedPasswordAtom.reportWrite(value, super.changedPassword, () {
      super.changedPassword = value;
    });
  }

  final _$changedPasswordConfirmationAtom =
      Atom(name: '_AuthControllerBase.changedPasswordConfirmation');

  @override
  bool? get changedPasswordConfirmation {
    _$changedPasswordConfirmationAtom.reportRead();
    return super.changedPasswordConfirmation;
  }

  @override
  set changedPasswordConfirmation(bool? value) {
    _$changedPasswordConfirmationAtom
        .reportWrite(value, super.changedPasswordConfirmation, () {
      super.changedPasswordConfirmation = value;
    });
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setChangedEmail(bool value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setChangedEmail');
    try {
      return super.setChangedEmail(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChangedPassword(bool value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setChangedPassword');
    try {
      return super.setChangedPassword(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChangedPasswordConfirmation(bool value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setChangedPasswordConfirmation');
    try {
      return super.setChangedPasswordConfirmation(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String? value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String? value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordConfirmation(String? value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setPasswordConfirmation');
    try {
      return super.setPasswordConfirmation(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordConfirmation: ${passwordConfirmation},
changedEmail: ${changedEmail},
changedPassword: ${changedPassword},
changedPasswordConfirmation: ${changedPasswordConfirmation}
    ''';
  }
}
