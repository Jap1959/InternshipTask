class PostModal {
  final int userId;
  final String title;
  final String body;
  final int id;
  PostModal(
      {required this.body,
      required this.id,
      required this.title,
      required this.userId});
  factory PostModal.fromJson(Map<String, dynamic> json) {
    return PostModal(
        body: json['body'],
        id: json['id'],
        title: json['title'],
        userId: json['userId']);
  }
}
