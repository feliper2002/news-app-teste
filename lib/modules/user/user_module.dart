import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/user/controller/user_controller.dart';
import 'package:news_app/modules/user/presenter/update.email.dart';
import 'package:news_app/modules/user/presenter/update.password.dart';
import 'package:news_app/modules/user/presenter/user.page.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => UserController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UserPage(user: args.data)),
    ChildRoute('/update_email',
        child: (_, args) => UpdateEmail(user: args.data)),
    ChildRoute('/update_password',
        child: (_, args) => UpdatePassword(user: args.data)),
    // ChildRoute('/update_phone', child: (_, args) => UpdateEmail()),
  ];
}
