import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/news/presenter/widgets/news_container.dart';
import 'package:news_app/shared/theme/colors.dart';

import 'events.page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.person),
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
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: 10,
              itemBuilder: (_, index) {
                return NewsContainer();
              },
            ),
            EventsPage(),
          ],
        ),
      ),
    );
  }
}
