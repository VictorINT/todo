class Post {
  final String ID;
  final String Title;
  final String Description;
  late final String Completed;

  Post({
    required this.ID,
    required this.Title,
    required this.Description,
    required this.Completed,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      ID: json['ID'] as String,
      Title: json['Title'] as String,
      Description: json['Description'] as String,
      Completed: json['Completed'] as String,
    );
  }
}
