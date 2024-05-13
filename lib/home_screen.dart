import 'package:flutter/material.dart';
import 'package:internship/colors.dart';
import 'package:internship/custom_button.dart';
import 'package:internship/post_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text(
          'HomeScreen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
              ),
              Center(
                child: CustomText(
                  value: 'Welcome to HomeScreen',
                  textSize: 25.0,
                  textWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(nextRouteName: '/Posts', buttonName: 'Task 4'),
              SizedBox(
                height: 10.0,
              ),
              CustomButton(nextRouteName: '/Task5', buttonName: 'Task 5'),
              SizedBox(
                height: 10.0,
              ),
              CustomButton(nextRouteName: '/Task6', buttonName: 'Task 6'),
            ],
          ),
        ),
      ),
    );
  }
}
