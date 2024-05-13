import 'package:flutter/material.dart';
import 'package:internship/colors.dart';
import 'package:internship/post_page.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.nextRouteName, required this.buttonName});
  final String buttonName;
  final String nextRouteName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, nextRouteName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColor,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: CustomText(
        value: buttonName,
        textWeight: FontWeight.w300,
      ),
    );
  }
}
