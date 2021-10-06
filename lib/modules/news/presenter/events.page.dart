import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';

class EventsPage extends StatelessWidget {
  final User? user;
  const EventsPage({Key? key, this.user}) : super(key: key);

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
    return Container();
  }
}
