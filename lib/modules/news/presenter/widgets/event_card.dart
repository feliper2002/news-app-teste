import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/news/presenter/controllers/event_controller.dart';

class EventCard extends StatelessWidget {
  final String? title;
  final Timestamp? date;
  final String? local;
  final bool? attend;
  EventCard({Key? key, this.title, this.date, this.local, this.attend})
      : super(key: key);

  final controller = Modular.get<EventController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title!),
    );
  }
}
