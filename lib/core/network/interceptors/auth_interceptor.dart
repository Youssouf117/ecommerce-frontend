import 'package:dio/dio.dart';
import 'package:ecommerce_mobile/core/services/storage_service.dart';

class AuthInterceptor extends Interceptor{
  final StorageService storageService=StorageService();

  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) async{
    final token =await storageService.getToken();
    print("TOKEN = $token");

    if(token!=null){
      options.headers["Authorization"]="Bearer $token";
    }

    handler.next(options);
  }
}