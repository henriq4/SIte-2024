class NotAuthorized extends Error {
  final String message;

  NotAuthorized(this.message);

  @override
  String toString() {
    return message;
  }
}
