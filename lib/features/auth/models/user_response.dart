
class UserResponse{
  final int id;


  final String username;

  final String email;

  final String phone;

  final String role;

  UserResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.role
});

  factory UserResponse.fromJson(Map<String,dynamic> json){
    return UserResponse(id: json["id"], username: json["username"], email: json["email"], phone: json["phone"], role:json["role"]);
  }
}