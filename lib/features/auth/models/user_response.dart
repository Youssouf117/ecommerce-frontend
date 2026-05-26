
class UserResponse{
  final int id;

  final String firstName;

  final String lastName;

  final String email;

  final String phone;

  final String role;

  UserResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role
});

  factory UserResponse.fromJson(Map<String,dynamic> json){
    return UserResponse(id: json["id"], firstName: json["firstName"], lastName: json["lastName"], email: json["email"], phone: json["phone"], role:json["role"]);
  }
}