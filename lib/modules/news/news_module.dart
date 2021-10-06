import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/news/presenter/news.page.dart';

class NewsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NewsPage()),
  ];
}
