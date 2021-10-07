import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/modules/news/domain/usecases/list_event.dart';
import 'package:news_app/modules/news/domain/usecases/update_event.dart';
part 'event_controller.g.dart';

class EventController = _EventControllerBase with _$EventController;

abstract class _EventControllerBase with Store {
  final ListEvents _listEventsUsecase;
  final UpdateEvent _updateEventUsecase;

  _EventControllerBase(this._listEventsUsecase, this._updateEventUsecase);

  ObservableStream<QuerySnapshot<Map<String, dynamic>>>? listEvents() {
    final response = _listEventsUsecase();

    ObservableStream<QuerySnapshot<Map<String, dynamic>>>? eventList;

    response!.fold((exception) {
      if (exception is UnprocessableEntityFailure) {
        if (exception.errors.containsKey('error')) {}
      } else if (exception is ServerFailure) {}
    }, (event) {
      eventList = event.asObservable();
      return event.asObservable();
    });

    return eventList;
  }
}
