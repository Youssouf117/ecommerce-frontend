

import 'package:dio/dio.dart';

class ApiClient{
  late Dio dio;

  ApiClient(){
    dio=Dio(
      BaseOptions(
        //URL du backend
        baseUrl: "http://localhost:8081/api/",          //10.0.2.2

        //Temps maximum d'attente
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),

        //Headers par defaut
        headers: {
          "Content-Type":"application/json",
        }
      )
    );
  }
}