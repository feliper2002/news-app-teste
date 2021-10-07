import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/news/domain/repositories/event_repository.dart';

abstract class ListEvents {
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>? call();
}

class ListEventsImpl implements ListEvents {
  final EventRepository repository;

  ListEventsImpl(this.repository);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>? call() {
    return repository.listEvent()!;
  }
}
