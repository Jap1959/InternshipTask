import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:internship/post_modal.dart';
import 'package:internship/post_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostModal> _posts = []; //  posts List to store from the api call
  bool loading =
      true; //loading variable for post loading // intial true for loading
  void fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        setState(() {
          loading = false;
          _posts = body.map((json) => PostModal.fromJson(json)).toList();
        });
      }
    } catch (e) {
      print('error:$e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: CustomText(
            value: 'Posts',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: loading
          ? const Center(
              child: SpinKitFadingFour(
              color: Colors.white,
            ))
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostConatiner(
                  post: _posts[index],
                );
              }),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({required this.value, this.textSize, this.textWeight});
  final String value;
  final double? textSize;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
          color: Colors.white,
          fontWeight: textWeight ?? FontWeight.w200,
          fontSize: textSize ?? 20.0),
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
    );
  }
}
