import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {required this.currentNode,
      required this.label,
      this.nextNode,
      required this.textController});
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final TextEditingController textController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: currentNode,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.white)),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      ),
      controller: textController,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextNode);
      },
    );
  }
}
