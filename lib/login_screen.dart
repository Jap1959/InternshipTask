import 'package:flutter/material.dart';
import 'package:internship/colors.dart';
import 'package:internship/custom_texfield.dart';
import 'package:internship/post_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // FocusNode to maange the Focus of the Textfield in Login screen
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _submitNode = FocusNode();
  // Textediting Controller to manage the text
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  late String error = ''; // String variable to hold error message
  bool _validateLoginForm() {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return false; // Form is not valid if email or password is empty
    }
    return true; // Form is valid if email and password are not empty
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            const Text(
              'Welcome to app',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0),
              overflow: TextOverflow.visible,
            ),
            const SizedBox(height: 40.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: 620,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'Login to Myapp',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextfield(
                      currentNode: _emailNode,
                      label: 'Email id',
                      nextNode: _passwordNode,
                      textController: _emailController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextfield(
                      currentNode: _passwordNode,
                      label: 'Password',
                      nextNode: _submitNode,
                      textController: _passwordController),
                  SizedBox(
                    height: 30.0,
                    child: Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool validate = _validateLoginForm();
                        if (validate) {
                          Navigator.popAndPushNamed(context, '/Home');
                        } else {
                          setState(() {
                            error = 'Please enter Email and Password';
                          });
                        }
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
                      child: const CustomText(
                        value: 'Log in',
                        textSize: 16.0,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
