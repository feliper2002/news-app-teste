import 'package:news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/modules/news/data/datasource/event_datasource.dart';
import 'package:news_app/modules/news/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDatasource datasource;

  EventRepositoryImpl(this.datasource);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>? listEvent() {
    try {
      final response = datasource.listEvents();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Either<Failure, void>? updateEvent(bool? attend, String? id) {
    try {
      final response = datasource.updateEvent(attend, id);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
