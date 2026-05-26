
import 'package:ecommerce_mobile/features/auth/models/user_response.dart';

class AuthResponse{
  final String message;

  final String token;

  final UserResponse userResponse;

  AuthResponse({
    required this.message,
    required this.token,
    required this.userResponse
});

  factory AuthResponse.fromJson(Map<String,dynamic> json){
    return AuthResponse(message: json["message"], token: json["message"], userResponse: UserResponse.fromJson(json["userResponse"]));
  }
}