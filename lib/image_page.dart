import 'package:flutter/material.dart';
import 'package:internship/colors.dart';
import 'package:internship/image_modal.dart';
import 'package:internship/post_page.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({required this.image});
  final ImageModal image;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.white,
        elevation: 4,
        title: const Center(
          child: CustomText(
            value: 'Image',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomText(
              value: 'Title',
              textWeight: FontWeight.w400,
            ),
            CustomText(
              value: widget.image.title,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  value: 'Imageid:${widget.image.id}',
                  textWeight: FontWeight.w400,
                ),
                CustomText(
                  value: 'AlbumId:${widget.image.albumId}',
                  textWeight: FontWeight.w400,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Image.network(widget.image.url),
          ],
        ),
      ),
    );
  }
}
