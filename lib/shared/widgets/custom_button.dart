import 'package:flutter/material.dart';
import 'package:news_app/shared/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final bool? enabled;
  const CustomButton({Key? key, this.text, this.onPressed, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled! ? onPressed : null,
      child: Text(
        text!,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            enabled! ? AppColors.mainColor : AppColors.disabledButton),
      ),
    );
  }
}
