class UserModel{
  final int id;
  final String name;
  final String email;
  final String password;
  final String invitation;
  final String location;
  final bool isActive;
  final String avatar;
  final int rating;
  final int emps;

  const UserModel({
    required this.id,
    this.name = "",
    required this.email,
    required this.password,
    required this.invitation,
    required this.location,
    this.isActive = true,
    this.avatar = "",
    this.rating = 0,
    this.emps = 0,
});

}