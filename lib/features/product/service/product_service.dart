import '../../../core/network/api_client.dart';
import '../models/product_model.dart';
class ProductService{
    final ApiClient apiClient=ApiClient();

    Future<List<ProductModel>> getProducts() async{
        try{
            final response= await apiClient.dio.get("products");

            final List<dynamic> data=response.data;

            return data.map((product) => ProductModel.fromJson(product)).toList();

        } catch(e) {
            throw Exception("Erreur lors du changement des produits");
        }
    }
}