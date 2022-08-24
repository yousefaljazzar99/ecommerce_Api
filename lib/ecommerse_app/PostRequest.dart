class PostRequest {
  String title;
  String body;
  int userId;

  PostRequest(this.title, this.body, this.userId);
  toJson() {
    return {
      'titel': title,
      'body': body,
      'userId': userId,
    };
  }
}
