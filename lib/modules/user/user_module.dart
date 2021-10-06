import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/user/presenter/user.page.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UserPage(user: args.data)),
  ];
}
