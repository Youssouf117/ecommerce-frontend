
import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/auth/models/auth_response.dart';
import 'package:ecommerce_mobile/features/auth/models/user_response.dart';
import 'package:ecommerce_mobile/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  final AuthService authService=AuthService();
  final StorageService storageService=StorageService();
  bool _isLoading=false;
  String? _errorMessage;
  UserResponse? _currentUser;
  AuthResponse? _authResponse;


  String? get errorMessage => _errorMessage;
  UserResponse? get currentUser => _currentUser;
  AuthResponse? get authResponse => _authResponse;
  bool get isLoading => _isLoading;
  void _setLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password
}) async{
    try{
      _setLoading(true);
      _errorMessage=null;
      final response=await authService.login(email: email, password: password);

      _authResponse=response;
      _currentUser=response.userResponse;
      notifyListeners();
      return true;
    } catch(e){
      _errorMessage="Email ou mot de passe incorrect"; //e.toString();
      notifyListeners();
      return false;
    } finally{
      _setLoading(false);
    }

  }

  Future<bool> register({
    required String fulName,
    required String email,
    required String phone,
    required String password,
  }) async {

    try {

      _setLoading(true);

      _errorMessage = null;

      await authService.register(
        fulName: fulName,
        email: email,
        phone: phone,
        password: password,
      );

      return true;

    } catch (e) {

      _errorMessage = "Erreur lors de l'inscription";//e.toString();

      notifyListeners();

      return false;

    } finally {

      _setLoading(false);
    }
  }

  Future<void> loadCurrentUser() async {

    try {

      final user =
      await authService.getCurrentUser();

      _currentUser = user;

      notifyListeners();

    } catch (e) {

      _currentUser = null;

      notifyListeners();
    }
  }

  Future<void> logout() async{

    await storageService.removeToken();

    _authResponse=null;
    _currentUser=null;
    notifyListeners();
  }

}