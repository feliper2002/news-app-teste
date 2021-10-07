import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/core/error/failure.dart';

abstract class EventDatasource {
  Stream<QuerySnapshot<Map<String, dynamic>>> listEvents();
  void updateEvent(bool? attend, String? id);
}

class EventDatasourceNews implements EventDatasource {
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listEvents() {
    final datesCollection =
        FirebaseFirestore.instance.collection('event').orderBy('date');

    try {
      return datesCollection.snapshots();
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível listar os eventos.');
    }
  }

  @override
  void updateEvent(bool? attend, String? id) {
    final eventCollection = FirebaseFirestore.instance.collection('event');

    try {
      eventCollection.where('id', isEqualTo: id).get().then((collection) {
        // ignore: avoid_function_literals_in_foreach_calls
        collection.docs.forEach((event) {
          eventCollection
              .doc(event.id)
              .set({'attend': attend}, SetOptions(merge: true));
        });
      });
    } catch (e) {
      throw ServerFailure(
          'Erro no servidor. Não foi possível atualizar o evento.');
    }
  }
}
