import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internship/image_list_page.dart';
import 'package:internship/image_modal.dart';
import 'package:internship/image_page.dart';
import 'package:internship/post_page.dart';
import 'package:internship/todo_modal.dart';

class TodoContainer extends StatelessWidget {
  TodoContainer({
    required this.todo,
  });
  final TodoModal todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              Checkbox(
                value: todo.completed,
                onChanged: (bool? value) {},
              ),
              const SizedBox(
                width: 20.0,
              ),
              CustomText(value: 'id ${todo.id}'),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                child: Text(
                  todo.title,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
