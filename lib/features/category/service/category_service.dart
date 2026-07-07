import 'package:dio/dio.dart';
import 'package:ecommerce_mobile/features/category/requests/create_category_request.dart';
import 'package:ecommerce_mobile/features/category/requests/update_category_request.dart';

import '../../../core/network/api_client.dart';
import '../models/category_model.dart';
class CategoryService {

  final ApiClient apiClient = ApiClient();


  Future<List<CategoryModel>> getCategories() async {

    try {

      final response =
          await apiClient.dio.get(
        "categories",
      );

      final List<dynamic> data =
          response.data;

      return data
          .map(
            (category) =>
                CategoryModel.fromJson(
                    category),
          )
          .toList();

    } catch (e) {

      throw Exception(
        "Erreur lors du chargement des catégories",
      );
    }
  }



  Future<CategoryModel> getCategoryById(int categoryId) async{
    try{
      final response=await apiClient.dio.get(
        "categories/$categoryId"
      );

      return CategoryModel.fromJson(response.data);
    } catch(e){
      throw Exception("Erreur lors de chargement de categories");
    }
  }


  Future<void> createCategory(CreateCategoryRequest request) async{
    try{
      await apiClient.dio.post(
        "categories",
        data: request.toJson()
      );
    } on DioException catch(e){
      final status = e.response?.statusCode;

      if (status == 400) {
        throw Exception("Données invalides");
      } else if (status == 403) {
        throw Exception("Accès refusé");
      } else {
        throw Exception("Erreur réseau ou serveur");
      }
    }
  }


  Future<void> updateCategory(int categoryId,UpdateCategoryRequest request) async{
    try{
      await apiClient.dio.put(
        "categories/$categoryId",
        data: request.toJson()
      );

    } catch(e){
      throw Exception("Erreur lors de la modification de la categorie");
    }
  }


  Future<void> deleteCategory(int categoryId) async{
    try{
      await apiClient.dio.delete(
        "categories/$categoryId",
      );
    } catch(e){
      throw Exception("Erreur lors de la suppression de la categorie");
    }
  }

}