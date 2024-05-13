class TodoModal {
  //  "userId": 1,
  //       "id": 2,
  //       "title": "quis ut nam facilis et officia qui",
  //       "completed": false
  final int userId;
  final int id;
  final String title;
  final bool completed;
  TodoModal(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});
  factory TodoModal.fromJson(Map<String, dynamic> json) {
    return TodoModal(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
