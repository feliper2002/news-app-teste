import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/presenter/controllers/register_controller.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';
import 'package:news_app/shared/widgets/custom_form_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final controller = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.clearAllFields();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Usuário',
              style: TextStyle(color: Colors.white)),
          backgroundColor: AppColors.mainColor,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: SingleChildScrollView(
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
                Observer(builder: (_) {
                  return CustomTextField(
                    labelText: 'Primeiro nome',
                    initialValue: controller.firstName,
                    onChanged: controller.setFirstName,
                    errorText: controller.changedFirstName!
                        ? controller.validateFirstName()
                        : null,
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return CustomTextField(
                    labelText: 'Sobrenome',
                    initialValue: controller.lastName,
                    onChanged: controller.setLastName,
                    errorText: controller.changedLastName!
                        ? controller.validateLastName()
                        : null,
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return CustomTextField(
                    labelText: 'E-mail',
                    initialValue: controller.email,
                    onChanged: controller.setEmail,
                    errorText: controller.changedEmail!
                        ? controller.validateEmail()
                        : null,
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return CustomTextField(
                    labelText: 'Senha',
                    initialValue: controller.password,
                    obscureText: true,
                    onChanged: controller.setPassword,
                    errorText: controller.changedPassword!
                        ? controller.validatePassword()
                        : null,
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return CustomTextField(
                    labelText: 'Confirmação de Senha',
                    initialValue: controller.passwordConfirmation,
                    obscureText: true,
                    onChanged: controller.setPasswordConfirmation,
                    errorText: controller.changedPasswordConfirmation!
                        ? controller.validatePasswordConfirmation()
                        : null,
                  );
                }),
                const SizedBox(height: 30),
                Observer(builder: (_) {
                  return CustomButton(
                    text: 'Confirmar',
                    enabled: controller.validateRegisterFields(),
                    onPressed: () async {
                      await controller.register();
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
