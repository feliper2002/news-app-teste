import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';

abstract class EventRepository {
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>? listEvent();
  Either<Failure, void>? updateEvent(bool? attend, String? id);
}
