enum AdminRoles {
  Admin,
  Editor,
  Moderator,
  Analyst,
}

class Admin {
  late String name;
  String image;
  late AdminRoles role;
  late String email;
  late String password;
  String? phoneNumber;
  late bool online;

  Admin({
    required this.name,
    required this.image,
    required this.role,
    required this.email,
    required this.password,
    this.phoneNumber,
    required this.online,
  });

  get getRole => role.toString().split('.').last;

}
