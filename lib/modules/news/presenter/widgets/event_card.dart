import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/news/presenter/controllers/event_controller.dart';
import 'package:news_app/shared/theme/colors.dart';

class EventCard extends StatelessWidget {
  final String? title;
  final Timestamp? date;
  final String? local;
  final String? id;
  final bool? attend;
  EventCard({Key? key, this.title, this.date, this.local, this.attend, this.id})
      : super(key: key);

  final controller = Modular.get<EventController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: size.height * .12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            offset: const Offset(2, 2),
            blurRadius: .7,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 90,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.today, size: 18, color: Colors.white),
                const SizedBox(height: 8),
                Text(
                  DateFormat.MMMd().format(date!.toDate()),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Row(
                      children: [
                        Icon(
                            local == 'online'
                                ? Icons.videocam_outlined
                                : Icons.place,
                            color: AppColors.mainColor,
                            size: 16),
                        Text(
                          local!,
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Observer(builder: (_) {
                  return OutlinedButton(
                    onPressed: () {
                      controller.updateEvent(attend, id);
                    },
                    child: Row(
                      children: [
                        Icon(attend! ? Icons.check : Icons.add,
                            size: 16,
                            color:
                                attend! ? Colors.white : AppColors.mainColor),
                        const SizedBox(width: 4),
                        Text(
                          attend! ? 'Comparecerei' : 'Comparecer',
                          style: TextStyle(
                            color:
                                !attend! ? AppColors.mainColor : Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          attend! ? AppColors.mainColor : Colors.white),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: AppColors.mainColor,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
