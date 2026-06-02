
class UserResponse{
  final int id;

  final String fulName;

  final String email;

  final String phone;

  final String role;

  UserResponse({
    required this.id,
    required this.fulName,
    required this.email,
    required this.phone,
    required this.role
});

  factory UserResponse.fromJson(Map<String,dynamic> json){
    return UserResponse(id: json["id"], fulName: json["fulName"],email: json["email"], phone: json["phone"], role:json["role"]);
  }
}