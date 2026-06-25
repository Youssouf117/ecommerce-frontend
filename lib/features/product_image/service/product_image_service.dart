import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_mobile/core/network/api_client.dart';
import 'package:ecommerce_mobile/features/product_image/models/product_image_model.dart';

class ProductImageService{
  final ApiClient apiClient=ApiClient();

  Future<List<ProductImageModel>> getImagesByProduct(int productId) async {
    final response=await apiClient.dio.get(
      "product-images/product/$productId"
    );

    final List<dynamic> data=response.data;

    return data
        .map((image) => ProductImageModel.fromJson(image))
        .toList();
  }

  Future<ProductImageModel> uploadImage({
    required File imageFile,
    required int productId,
    bool isMain=false
}) async{
    try{
      FormData formData=FormData.fromMap({
        "file":await MultipartFile.fromFile(imageFile.path),
        "productId":productId,
        "isMain":isMain
      });
      
      final response=await apiClient.dio.post(
        "product-images/upload",
          data: formData
      );
      
      return ProductImageModel.fromJson(response.data);
    } on DioException catch(e){
      throw Exception(
        e.response?.data["message"] ?? "Erreur lors de l'upload de l'image"
      );
    }
  }

}