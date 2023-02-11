class Task {
  var id = 0;
  var title = "";
  var description = "";

  Task({
    required this.id,
    required this.title,
    this.description = "",
  });
}
