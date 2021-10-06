import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';
import 'package:news_app/shared/widgets/custom_form_field.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final controller = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appLogo(),
              const SizedBox(height: 8),
              Observer(builder: (_) {
                return CustomTextField(
                  labelText: 'E-mail',
                  errorText: controller.changedEmail!
                      ? controller.validateEmail()
                      : null,
                  prefixIcon: const Icon(Icons.mail),
                  onChanged: controller.setEmail,
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return CustomTextField(
                  labelText: 'Senha',
                  errorText: controller.changedPassword!
                      ? controller.validatePassword()
                      : null,
                  prefixIcon: const Icon(Icons.password),
                  onChanged: controller.setPassword,
                );
              }),
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return CustomButton(
                  enabled: controller.validateLoginFields()!,
                  onPressed: () async {
                    await controller.login(
                        controller.email, controller.password);
                    await Modular.to.popAndPushNamed('/news');
                  },
                  text: 'Login',
                );
              }),
              const SizedBox(height: 20),
              _notRegistered(),
              const SizedBox(height: 16),
              CustomButton(
                enabled: true,
                onPressed: () async {
                  controller.clearAllFields();
                  await Modular.to.pushNamed('/register');
                },
                text: 'Cadastrar',
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  await Modular.to.popAndPushNamed('/news');
                },
                child: Text(
                  'Continuar sem autenticação >>>',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appLogo() => Text.rich(TextSpan(
        text: 'News APP\n',
        style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 40,
            fontWeight: FontWeight.w900),
        children: [
          TextSpan(
            text: 'Seu aplicativo de notícias!\n',
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 22,
                fontWeight: FontWeight.w900),
          ),
        ],
      ));

  _notRegistered() => Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.mainColor,
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
          Text(
            'Não possui conta?',
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w900),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.mainColor,
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
        ],
      );
}
