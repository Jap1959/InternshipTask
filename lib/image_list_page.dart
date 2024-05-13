import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:internship/image_modal.dart';
import 'package:internship/image_widget.dart';
import 'package:internship/post_modal.dart';
import 'package:internship/post_page.dart';
import 'package:internship/post_widget.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({super.key});

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  List<ImageModal> _images = []; //  posts List to store from the api call
  bool loading =
      true; //loading variable for post loading // intial true for loading
  void fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        setState(() {
          loading = false;
          _images = body.map((json) => ImageModal.fromJson(json)).toList();
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
            value: 'Photos',
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
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return ImageContainer(
                  image: _images[index],
                );
              }),
    );
  }
}
