
import 'package:dio/dio.dart';
import 'package:ecommerce_mobile/core/network/api_client.dart';
import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/auth/models/auth_response.dart';

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

      //Convertir Json ---> objet Dart
      final authResponse=AuthResponse.fromJson(response.data);

      //Sauvegarder le Jwt
      await storageService.saveToken(authResponse.token);

      return authResponse;
    } on DioException catch(e){
      throw Exception(
        e.response?.data["message"] ?? "Erreur de connexion"
      );
    }

  }

  //Register
  Future<AuthResponse> register({required String fulName,required String email,required String phone,required String password}) async {
    try{
      final response=await apiClient.dio.post(
        "auth/register",
        data: {
          "fulName":fulName,
          "email":email,
          "phone":phone,
          "password":password
        }
      );

      //Json --> objet Dart
      final authResponse=AuthResponse.fromJson(response.data);

      //Sauvegarder le token
      await storageService.saveToken(authResponse.token);

      return authResponse;
    } on DioException catch(e){
      throw Exception(
        e.response?.data["message"] ?? "Erreur d'inscription"
      );
    }
  }
}