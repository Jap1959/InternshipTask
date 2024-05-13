import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internship/image_list_page.dart';
import 'package:internship/image_modal.dart';
import 'package:internship/image_page.dart';
import 'package:internship/post_page.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({
    required this.image,
  });
  final ImageModal image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ImagePage(image: image)));
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Image.network(image.thumbnailUrl),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    image.title,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
