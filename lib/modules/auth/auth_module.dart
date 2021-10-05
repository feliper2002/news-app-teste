import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:news_app/modules/auth/domain/usecases/register.dart';

import 'presenter/auth.page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RegisterImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
