import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  final String? title;
  final String? date;
  final String? body;
  final String? author;
  final int? views;
  final int? comments;
  final int? likes;
  const NewsContainer(
      {Key? key,
      this.title,
      this.date,
      this.body,
      this.author,
      this.views,
      this.comments,
      this.likes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            offset: const Offset(3, 3),
            blurRadius: .6,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text('Título news'),
                const Spacer(),
                Text('data news'),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          const Spacer(),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.person_pin_outlined),
                    Text('Autor news'),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.visibility),
                        const SizedBox(width: 3),
                        Text('20'),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Icon(Icons.message),
                        const SizedBox(width: 3),
                        Text('10'),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Icon(Icons.favorite),
                        const SizedBox(width: 3),
                        Text('5'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
