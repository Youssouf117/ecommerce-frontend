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
}