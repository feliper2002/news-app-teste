import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/news/data/datasource/news_datasource.dart';
import 'package:news_app/modules/news/data/repositories/news_repository_impl.dart';
import 'package:news_app/modules/news/domain/usecases/list_news.dart';
import 'package:news_app/modules/news/presenter/controllers/news_controller.dart';
import 'package:news_app/modules/news/presenter/news.page.dart';

class NewsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => NewsDatasourceNews()),
    Bind((i) => NewsRepositoryImpl(i.get())),
    Bind((i) => ListNewsImpl(i.get())),
    Bind((i) => NewsController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NewsPage()),
  ];
}
