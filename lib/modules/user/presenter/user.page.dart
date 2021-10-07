import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:news_app/modules/user/controller/user_controller.dart';
import 'package:news_app/shared/theme/colors.dart';
import 'package:news_app/shared/widgets/custom_button.dart';

class UserPage extends StatelessWidget {
  final User? user;
  UserPage({Key? key, this.user}) : super(key: key);

  String? get iniciais {
    String? nome;
    if (user != null) {
      if (user!.displayName!.contains(' ')) {
        final lista = user!.displayName!.split(' ');
        nome = ('${lista[0][0].toUpperCase()}${lista[1][0].toUpperCase()}');
      } else {
        nome = user!.displayName![0];
      }
      return nome;
    }
  }

  final controller = Modular.get<UserController>();
  final auth = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
            user == null ? 'Usuário (deslogado)' : 'Informações de Usuário',
            style: const TextStyle(color: Colors.white)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: 70,
                  child: Center(
                    child: user == null
                        ? const Icon(Icons.person_outline, size: 56)
                        : Text(
                            iniciais!,
                            style: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user != null ? user!.displayName! : 'Usuário deslogado 🙁',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: user == null,
                  child: CustomButton(
                    text: 'Fazer Login',
                    onPressed: () {
                      Modular.to.navigate('/');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Visibility(
              visible: user != null,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-mail',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              user != null ? user!.email! : 'Não configurado',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () async {
                                await Modular.to.pushNamed('/user/update_email',
                                    arguments: user);
                              },
                              child: const Text('Alterar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            for (int i = 0; i <= 2; i++)
                              Icon(Icons.password, color: Colors.grey),
                            const Spacer(),
                            TextButton(
                              onPressed: () async {
                                await Modular.to.pushNamed(
                                    '/user/update_password',
                                    arguments: user);
                              },
                              child: Text('Alterar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Visibility(
              visible: user != null,
              child: Column(
                children: [
                  CustomButton(
                    text: 'Sair da conta',
                    onPressed: () async {
                      await auth.signout();
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, top: 6),
                    width: 155,
                    child: Observer(builder: (_) {
                      return OutlinedButton(
                        onPressed: () async {
                          await auth.deleteAccont();
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.delete, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              'Deletar conta',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
