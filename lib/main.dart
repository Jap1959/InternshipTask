import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:internship/colors.dart';
import 'package:internship/connectivity_check.dart';
import 'package:internship/home_screen.dart';
import 'package:internship/image_list_page.dart';
import 'package:internship/login_screen.dart';
import 'package:internship/post_page.dart';
import 'package:internship/todo_list_task_6.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          toolbarHeight: 10.0,
          backgroundColor: lightColor,
        ),
        body: const ConnectivityCheck(
          child: LoginScreen(),
        ),
      ),
      // routes for the App
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) =>
            const HomeScreen(), //Home Screen  Route
        '/Posts': (BuildContext context) => const PostPage(),
        '/Task5': (BuildContext context) => const ImageListPage(),
        '/Task6': (BuildContext context) => const TodoListPage(),
      },
    );
  }
}
