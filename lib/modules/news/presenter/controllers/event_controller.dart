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

  void updateEvent(bool? attend, String? eventID) {
    /// Will [update] the event by getting the respective [eventID]
    ///
    /// The data [attend] will be sent to Firestore Database and the method [set] of Firestore instance will merge the new data state with actual collection values
    ///
    final response = _updateEventUsecase(attend, eventID);

    response!.fold((exception) {
      if (exception is UnprocessableEntityFailure) {
        if (exception.errors.containsKey('error')) {}
      } else if (exception is ServerFailure) {}
    }, (updated) {
      print('Atualizou evento $eventID');
    });
  }
}
