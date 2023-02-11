class User {
  var id = 0;
  var name = "";
  var role = "";
  var email = "";
  var password = "";
  User({
    required this.id,
    required this.name,
    this.role = "member",
    required this.email,
    required this.password,
  });
}
