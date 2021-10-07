import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:news_app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:news_app/modules/auth/domain/usecases/delete_account.dart';
import 'package:news_app/modules/auth/domain/usecases/login.dart';
import 'package:news_app/modules/auth/domain/usecases/signout.dart';
import 'package:news_app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:news_app/modules/user/controller/user_controller.dart';
import 'package:news_app/modules/user/presenter/update.email.dart';
import 'package:news_app/modules/user/presenter/update.password.dart';
import 'package:news_app/modules/user/presenter/user.page.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => UserController()),
    Bind((i) => AuthDatasourceNews()),
    Bind((i) => AuthRepositoryImpl(i.get())),
    Bind((i) => LoginImpl(i.get())),
    Bind((i) => AuthController(i.get(), i.get(), i.get())),
    Bind((i) => DeleteAccontImpl(i.get())),
    Bind((i) => SignoutImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UserPage(user: args.data)),
    ChildRoute('/update_email',
        child: (_, args) => UpdateEmail(user: args.data)),
    ChildRoute('/update_password',
        child: (_, args) => UpdatePassword(user: args.data)),
  ];
}
