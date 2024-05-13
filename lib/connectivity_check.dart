import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:internship/login_screen.dart';
import 'package:internship/post_page.dart';

class ConnectivityCheck extends StatefulWidget {
  final Widget child;

  const ConnectivityCheck({Key? key, required this.child}) : super(key: key);

  @override
  State<ConnectivityCheck> createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  @override
  Widget build(BuildContext context) {
    bool connectedToInternet = false;
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return widget.child;
        }
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            Center(
              child: !connected
                  ? AlertDialog(
                      title: const Text('No Internet Connection'),
                      content: const Text('Please connect to the Internet'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Close',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CustomText(
            value: 'Please Connect to internet to continue',
            textSize: 25.0,
            textWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
