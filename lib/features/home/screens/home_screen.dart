import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});
  
  final StorageService storageService=StorageService();
  
  Future<void> logoutUser(BuildContext context) async{
    await storageService.removeToken();
    
    Navigator.pushNamedAndRemoveUntil(context,AppRoutes.login, (route) => false);
    
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Acceuil"),
        actions: [
          IconButton(
            onPressed: () {
              logoutUser(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
      
    );
  }
}