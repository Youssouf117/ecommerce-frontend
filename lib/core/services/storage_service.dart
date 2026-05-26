
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  //Instance de FlutterSecureStorage
  final FlutterSecureStorage storage= const FlutterSecureStorage();

  //Cle utilsee pour Stoker le token
  static const String tokenKey="jwt_token";

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
}