import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';
import 'package:news_app/shared/widgets/custom_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário',
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Informe seus dados para efetuar o cadastro em nosso aplicativo.',
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              labelText: 'Primeiro nome',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Sobrenome',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'E-mail',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Senha',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Confirmação de Senha',
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Confirmar',
              onPressed: () async {
                await Modular.to.pushNamed('/auth_confirm');
              },
            ),
          ],
        ),
      ),
    );
  }
}
