import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/news/domain/repositories/event_repository.dart';

abstract class UpdateEvent {
  Either<Failure, void>? call(bool? attend, String? id);
}

class UpdateEventImpl implements UpdateEvent {
  final EventRepository repository;

  UpdateEventImpl(this.repository);

  @override
  Either<Failure, void>? call(bool? attend, String? id) {
    attend = !attend!;

    return repository.updateEvent(attend, id);
  }
}
