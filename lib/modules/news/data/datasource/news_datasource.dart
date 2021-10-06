import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/core/error/failure.dart';

abstract class NewsDatasource {
  Stream<QuerySnapshot<Map<String, dynamic>>> listNews();
}

class NewsDatasourceNews implements NewsDatasource {
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listNews() {
    final datesCollection = FirebaseFirestore.instance
        .collection('news')
        .orderBy('date', descending: true);

    try {
      return datesCollection.snapshots();
    } catch (e) {
      throw ServerFailure('Erro no servidor. Não foi listar as notícias.');
    }
  }
}
