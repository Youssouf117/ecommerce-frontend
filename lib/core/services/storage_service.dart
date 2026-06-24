
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  //Instance de FlutterSecureStorage
  final FlutterSecureStorage storage= const FlutterSecureStorage();

  //Cle utilsee pour Stoker le token
  static const String tokenKey="jwt_token";
  static const String userIdKey = "user_id";

  //Sauvegarder le token
  Future<void> saveToken(String token) async{
    await storage.write(key: tokenKey, value: token);
  }

  //Recuperer le token
  Future<String?> getToken() async{
    return await storage.read(key: tokenKey);
  }

  //Supprimer le token
  Future<void> removeToken() async {
    await storage.delete(key: tokenKey);
  }

  // User Id
/*  Future<void> saveUserId(
      int userId) async {
    await storage.write(
      key: userIdKey,
      value: userId.toString(),
    );
  }

  Future<int?> getUserId() async {
    final userId = await storage.read(
      key: userIdKey,
    );

    if (userId == null) {
      return null;
    }

    return int.parse(userId);
  }

  Future<void> removeUserId() async {
    await storage.delete(
      key: userIdKey,
    );
  }*/
}