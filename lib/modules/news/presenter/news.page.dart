import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/news/presenter/controllers/news_controller.dart';
import 'package:news_app/modules/news/presenter/widgets/news_container.dart';
import 'package:news_app/shared/theme/colors.dart';

import 'events.page.dart';

class NewsPage extends StatelessWidget {
  User? user;
  NewsPage({Key? key, this.user}) : super(key: key);

  final controller = Modular.get<NewsController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(user != null ? Icons.person : Icons.person_outline),
            onPressed: () async {
              await Modular.to.pushNamed('/user');
            },
          ),
          centerTitle: true,
          title: const Text('News APP', style: TextStyle(color: Colors.white)),
          backgroundColor: AppColors.mainColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.text_snippet_outlined),
                text: 'Notícias',
              ),
              Tab(
                icon: Icon(Icons.event),
                text: 'Eventos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.listNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (_, index) {
                        final docs = snapshot.data!.docs[index].data();
                        return NewsContainer(
                          title: docs['title'],
                          date: docs['date'],
                          body: docs['body'],
                          author: docs['author'],
                          views: docs['views'],
                          comments: docs['comments'],
                          likes: docs['likes'],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child:
                          CircularProgressIndicator(color: AppColors.mainColor),
                    );
                  }
                }),
            EventsPage(),
          ],
        ),
      ),
    );
  }
}
