import 'package:news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/modules/news/data/datasource/news_datasource.dart';
import 'package:news_app/modules/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDatasource datasource;

  NewsRepositoryImpl(this.datasource);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>? listNews() {
    try {
      final response = datasource.listNews();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
