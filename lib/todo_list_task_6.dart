import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:internship/post_page.dart';
import 'package:internship/todo_container.dart';
import 'package:internship/todo_modal.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<TodoModal> _todos = []; //  posts List to store from the api call
  List<TodoModal> _todoCopy = [];
  bool filterOn = false;
  bool loading =
      true; //loading variable for post loading // intial true for loading
  TextEditingController textController = TextEditingController();
  void fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        setState(() {
          loading = false;
          _todos = body.map((json) => TodoModal.fromJson(json)).toList();
          _todoCopy = _todos;
        });
      }
    } catch (e) {
      print('error:$e');
    }
  }

  void searchData(String searchString) {
    try {
      setState(() {
        if (searchString.length == 0) {
          _todos = _todoCopy;
        } else {
          _todos = _todoCopy
              .where((element) => element.title.startsWith(searchString))
              .toList();
        }
      });
    } catch (e) {}
  }

  void filterData() {
    try {
      setState(() {
        if (filterOn) {
          _todos =
              _todos.where((element) => element.completed == false).toList();
        } else {
          _todos = _todoCopy;
        }
      });
    } catch (e) {}
  }

  void sortData() {
    try {
      setState(() {
        _todos.sort((a, b) => a.id.compareTo(b.id));
      });
    } catch (e) {}
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
            value: 'Todos',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      filterOn = !filterOn;
                    });
                    filterData();
                  },
                  icon: !filterOn
                      ? const Icon(
                          Icons.filter_alt_off_sharp,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.filter_alt_sharp,
                          color: Colors.white,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {
                    sortData();
                  },
                  icon: const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: loading
          ? const Center(
              child: SpinKitFadingFour(
              color: Colors.white,
            ))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: 'Enter text',
                      hintStyle: const TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                    ),
                    controller: textController,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) {
                      searchData(textController.text);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        return _todos.length != 0
                            ? TodoContainer(
                                todo: _todos[index],
                              )
                            : const Center(
                                child: SizedBox(
                                child: Text('No results'),
                              ));
                      }),
                ),
              ],
            ),
    );
  }
}
