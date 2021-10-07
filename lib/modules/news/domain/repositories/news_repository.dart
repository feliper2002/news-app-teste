import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';

abstract class NewsRepository {
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>? listNews();
}
