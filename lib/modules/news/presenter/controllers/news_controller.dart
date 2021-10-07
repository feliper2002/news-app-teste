import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/news/domain/usecases/list_news.dart';
part 'news_controller.g.dart';

class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {
  final ListNews _listNewsUsecase;

  _NewsControllerBase(this._listNewsUsecase);

  ObservableStream<QuerySnapshot<Map<String, dynamic>>>? listNews() {
    final response = _listNewsUsecase();

    ObservableStream<QuerySnapshot<Map<String, dynamic>>>? newsList;

    response.fold((exception) {
      if (exception is UnprocessableEntityFailure) {
        if (exception.errors.containsKey('error')) {}
      } else if (exception is ServerFailure) {}
    }, (news) {
      newsList = news.asObservable();
      return news.asObservable();
    });
    return newsList;
  }
}
