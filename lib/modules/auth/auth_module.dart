import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:news_app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:news_app/modules/auth/domain/usecases/login.dart';
import 'package:news_app/modules/auth/domain/usecases/register.dart';
import 'package:news_app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:news_app/modules/auth/presenter/controllers/register_controller.dart';

import 'domain/usecases/delete_account.dart';
import 'domain/usecases/signout.dart';
import 'presenter/auth.page.dart';
import 'presenter/register.page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthDatasourceNews()),
    Bind((i) => AuthRepositoryImpl(i.get())),
    Bind((i) => RegisterImpl(i.get())),
    Bind((i) => LoginImpl(i.get())),
    Bind((i) => AuthController(i.get(), i.get(), i.get())),
    Bind((i) => RegisterController(i.get())),
    Bind((i) => DeleteAccontImpl(i.get())),
    Bind((i) => SignoutImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
    ChildRoute('/register', child: (_, args) => RegisterPage()),
  ];
}
