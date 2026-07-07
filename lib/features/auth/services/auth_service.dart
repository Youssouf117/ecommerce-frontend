
import 'package:dio/dio.dart';
import 'package:ecommerce_mobile/core/network/api_client.dart';
import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/auth/models/auth_response.dart';
import 'package:ecommerce_mobile/features/auth/models/user_response.dart';

class AuthService{
  final StorageService storageService=StorageService();
  final ApiClient apiClient=ApiClient();

  //Login
  Future<AuthResponse> login({required String email,required String password}) async{
    try{
      final response=await apiClient.dio.post(
        "auth/login",
        data: {
          "email":email,
          "password":password
        }
      );
      if(response.statusCode==200){
        print("Backend valide avec le code 200");
      }
      else{
        print("Backend non valide, le code n'est pas 200");
      }

      //Convertir Json ---> objet Dart
      final authResponse=AuthResponse.fromJson(response.data);
      print("message : ${authResponse.message}");

      //Sauvegarder le Jwt
      await storageService.saveToken(authResponse.token);
      print("Token : ${authResponse.token}");
      print("userId : ${authResponse.userResponse.id}");

      return authResponse;
    } on DioException catch(e){
      throw Exception(
        e.response?.data["message"] ?? "Erreur de connexion"
      );
    }

  }

  Future<UserResponse> getCurrentUser() async {

    try {

      final response =
      await apiClient.dio.get(
        "auth/me",
      );
      if(response.statusCode==200){
        print("Backend valide getCurrentUser avec le code 200");
      }
      else{
        print("Backend non valide getCurrentUser, le code n'est pas 200");
      }
      UserResponse UserCurrent=UserResponse.fromJson(
        response.data,
      );
      print('Dans getCurrentUser,on a est : ${UserCurrent}');
      print('Dans getCurrentUser, id est : ${UserCurrent.id}');
      print('Dans getCurrentUser, role est : ${UserCurrent.role}');

      return UserCurrent;

    } on DioException catch (e) {

      throw Exception(
        e.response?.data["message"] ??
            "Erreur lors du chargement du profil",
      );
    }
  }

  //Register
  Future<void> register({required String fulName,required String email,required String phone,required String password}) async {
    try{
      await apiClient.dio.post(
        "auth/register",
        data: {
          "fulName":fulName,
          "email":email,
          "phone":phone,
          "password":password
        }
      );
    } on DioException catch(e){
      throw Exception(
        e.response?.data["message"] ?? "Erreur d'inscription"
      );
    }
  }
}