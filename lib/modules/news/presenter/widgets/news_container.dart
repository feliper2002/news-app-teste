import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsContainer extends StatelessWidget {
  final String? title;
  final Timestamp? date;
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
                Text(
                  '$title',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(DateFormat.MMMd().format(date!.toDate())),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Container(
            height: size.height * .083,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(body!),
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
                    const Icon(Icons.person_pin_outlined),
                    Text('$author'),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.visibility),
                        const SizedBox(width: 3),
                        Text('$views'),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.message),
                        const SizedBox(width: 3),
                        Text('$comments'),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.favorite),
                        const SizedBox(width: 3),
                        Text('$likes'),
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
