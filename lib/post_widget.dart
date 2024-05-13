import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internship/post_modal.dart';
import 'package:internship/post_page.dart';

class PostConatiner extends StatelessWidget {
  PostConatiner({
    required this.post,
  });
  final PostModal post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 280),
                    width: 500,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                      child: Icon(Icons.ac_unit_sharp)),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  CustomText(value: 'ID:${post.id}'),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  CustomText(value: 'USERID:${post.userId}'),
                                ],
                              ),
                              Text(
                                post.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomText(
                                value: post.body,
                                textSize: 13.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
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
                const CircleAvatar(child: Icon(Icons.ac_unit_sharp)),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    post.title,
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
