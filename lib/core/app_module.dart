import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/news', module: AuthModule()),
    ModuleRoute('/user', module: AuthModule()),
  ];
}
