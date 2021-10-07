import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/user/controller/user_controller.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';
import 'package:news_app/shared/widgets/custom_form_field.dart';

class UpdatePassword extends StatelessWidget {
  final User? user;
  UpdatePassword({Key? key, this.user}) : super(key: key);

  final controller = Modular.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.clearAllFields();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: const Text('Atualizar Senha',
              style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Column(
            children: [
              Observer(builder: (_) {
                return CustomTextField(
                  labelText: 'Nova senha',
                  prefixIcon: const Icon(Icons.mail_outline),
                  onChanged: controller.setPassword,
                  obscureText: true,
                  errorText: controller.changedPassword!
                      ? controller.validatePassword()
                      : null,
                );
              }),
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return CustomTextField(
                  labelText: 'Confirmar senha',
                  prefixIcon: Icon(Icons.mail_outline),
                  onChanged: controller.setPasswordConfirmation,
                  obscureText: true,
                  errorText: controller.changedPasswordConfirmation!
                      ? controller.validatePasswordConfirmation()
                      : null,
                );
              }),
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return CustomButton(
                  text: 'Atualizar',
                  enabled: controller.validatePasswordUpdate(),
                  onPressed: () async {
                    await user!.updatePassword(controller.password!);
                    await user!.reload();
                    Modular.to.navigate('/');
                    controller.clearAllFields();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
