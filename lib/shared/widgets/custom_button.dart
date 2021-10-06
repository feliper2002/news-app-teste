import 'package:flutter/material.dart';
import 'package:news_app/shared/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const CustomButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
      ),
    );
  }
}
