import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/news/presenter/controllers/event_controller.dart';
import 'package:news_app/modules/news/presenter/widgets/event_card.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';

class EventsPage extends StatelessWidget {
  final User? user;
  EventsPage({Key? key, this.user}) : super(key: key);

  final controller = Modular.get<EventController>();

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber, color: Colors.red, size: 90),
            Text.rich(
              TextSpan(
                text: 'OPA!!\n',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text:
                        'Para ter acesso a esta página, você ao menos precisa estar conectado a uma conta autenticada no aplicativo.\n',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            CustomButton(
              text: 'Fazer Login',
              onPressed: () {
                Modular.to.navigate('/');
              },
            ),
          ],
        ),
      );
    }
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.listEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                final docs = snapshot.data!.docs[index].data();
                return EventCard(
                  title: docs['title'],
                  date: docs['date'],
                  attend: docs['attend'],
                  local: docs['local'],
                  id: docs['id'],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            );
          }
        });
  }
}
