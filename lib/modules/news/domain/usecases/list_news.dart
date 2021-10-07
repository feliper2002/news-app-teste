import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/news/domain/repositories/news_repository.dart';

abstract class ListNews {
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call();
}

class ListNewsImpl implements ListNews {
  final NewsRepository repository;

  ListNewsImpl(this.repository);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call() {
    return repository.listNews()!;
  }
}
